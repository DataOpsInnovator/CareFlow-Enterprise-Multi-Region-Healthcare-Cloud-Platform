resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = 30
  enable_key_rotation     = true
  multi_region            = var.multi_region
  tags                    = var.tags
}
resource "aws_kms_alias" "this" { name = "alias/${var.name}"; target_key_id = aws_kms_key.this.key_id }
