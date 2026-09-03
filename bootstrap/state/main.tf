terraform { required_providers { aws={source="hashicorp/aws",version="~> 6.62"} } }
provider "aws" { region=var.region }
resource "aws_kms_key" "state" { description="Terraform state"; enable_key_rotation=true; deletion_window_in_days=30 }
resource "aws_s3_bucket" "state" { bucket=var.bucket_name }
resource "aws_s3_bucket_versioning" "state" { bucket=aws_s3_bucket.state.id; versioning_configuration { status="Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "state" { bucket=aws_s3_bucket.state.id; rule { apply_server_side_encryption_by_default { sse_algorithm="aws:kms"; kms_master_key_id=aws_kms_key.state.arn } } }
resource "aws_s3_bucket_public_access_block" "state" { bucket=aws_s3_bucket.state.id; block_public_acls=true; block_public_policy=true; ignore_public_acls=true; restrict_public_buckets=true }
resource "aws_dynamodb_table" "locks" { name=var.lock_table; billing_mode="PAY_PER_REQUEST"; hash_key="LockID"; attribute { name="LockID"; type="S" }; point_in_time_recovery { enabled=true } }
variable "region" { type=string; default="us-east-1" }
variable "bucket_name" { type=string }
variable "lock_table" { type=string; default="careflow-terraform-locks" }
