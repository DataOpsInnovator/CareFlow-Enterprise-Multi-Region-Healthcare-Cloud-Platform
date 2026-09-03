output "cluster_name" { value=module.eks.cluster_name }
output "database_endpoint" { value=module.aurora.endpoint; sensitive=true }
output "clinical_bucket" { value=module.clinical_data.bucket_name }
