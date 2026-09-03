resource "aws_s3_bucket" "this" { bucket=var.name; object_lock_enabled=var.object_lock; tags=var.tags }
resource "aws_s3_bucket_versioning" "this" { bucket=aws_s3_bucket.this.id; versioning_configuration { status="Enabled" } }
resource "aws_s3_bucket_server_side_encryption_configuration" "this" { bucket=aws_s3_bucket.this.id; rule { apply_server_side_encryption_by_default { sse_algorithm="aws:kms"; kms_master_key_id=var.kms_key_arn } bucket_key_enabled=true } }
resource "aws_s3_bucket_public_access_block" "this" { bucket=aws_s3_bucket.this.id; block_public_acls=true; block_public_policy=true; ignore_public_acls=true; restrict_public_buckets=true }
resource "aws_s3_bucket_ownership_controls" "this" { bucket=aws_s3_bucket.this.id; rule { object_ownership="BucketOwnerEnforced" } }
resource "aws_s3_bucket_lifecycle_configuration" "this" { bucket=aws_s3_bucket.this.id; rule { id="archive"; status="Enabled"; transition { days=30; storage_class="STANDARD_IA" }; transition { days=90; storage_class="GLACIER_IR" }; noncurrent_version_expiration { noncurrent_days=365 } } }
