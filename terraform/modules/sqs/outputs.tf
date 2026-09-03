output "queue_arn" { value=aws_sqs_queue.this.arn }
output "queue_url" { value=aws_sqs_queue.this.url }
output "dlq_arn" { value=aws_sqs_queue.dlq.arn }
