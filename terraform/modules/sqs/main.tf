resource "aws_sqs_queue" "dlq" { name="${var.name}-dlq"; kms_master_key_id=var.kms_key_arn; message_retention_seconds=1209600; tags=var.tags }
resource "aws_sqs_queue" "this" { name=var.name; kms_master_key_id=var.kms_key_arn; visibility_timeout_seconds=var.visibility_timeout; redrive_policy=jsonencode({deadLetterTargetArn=aws_sqs_queue.dlq.arn,maxReceiveCount=5}); tags=var.tags }
