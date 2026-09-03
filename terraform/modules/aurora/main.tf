resource "aws_security_group" "db" { name_prefix="${var.name}-db-"; vpc_id=var.vpc_id; tags=var.tags }
resource "aws_vpc_security_group_ingress_rule" "postgres" { security_group_id=aws_security_group.db.id; cidr_ipv4=var.client_cidr; from_port=5432; to_port=5432; ip_protocol="tcp" }
resource "aws_rds_cluster" "this" {
  cluster_identifier = var.name
  engine = "aurora-postgresql"
  engine_mode = "provisioned"
  database_name = var.database_name
  master_username = var.master_username
  manage_master_user_password = true
  master_user_secret_kms_key_id = var.kms_key_arn
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db.id]
  storage_encrypted = true
  kms_key_id = var.kms_key_arn
  backup_retention_period = 35
  preferred_backup_window = "03:00-04:00"
  deletion_protection = true
  copy_tags_to_snapshot = true
  enabled_cloudwatch_logs_exports = ["postgresql"]
  skip_final_snapshot = false
  final_snapshot_identifier = "${var.name}-final"
  tags = var.tags
}
resource "aws_rds_cluster_instance" "this" {
  count = 2
  identifier = "${var.name}-${count.index+1}"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class = var.instance_class
  engine = aws_rds_cluster.this.engine
  engine_version = aws_rds_cluster.this.engine_version
  publicly_accessible = false
  auto_minor_version_upgrade = true
  tags = var.tags
}
