resource "aws_cloudwatch_event_bus" "this" { name=var.name; tags=var.tags }
resource "aws_cloudwatch_event_rule" "clinical" { name="${var.name}-clinical-events"; event_bus_name=aws_cloudwatch_event_bus.this.name; event_pattern=jsonencode({source=["careflow.clinical"]}); tags=var.tags }
resource "aws_cloudwatch_event_target" "sqs" { rule=aws_cloudwatch_event_rule.clinical.name; event_bus_name=aws_cloudwatch_event_bus.this.name; arn=var.target_queue_arn }
