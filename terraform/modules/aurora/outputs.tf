output "endpoint" { value=aws_rds_cluster.this.endpoint }
output "reader_endpoint" { value=aws_rds_cluster.this.reader_endpoint }
output "secret_arn" { value=try(aws_rds_cluster.this.master_user_secret[0].secret_arn, null); sensitive=true }
