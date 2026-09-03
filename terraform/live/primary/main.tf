locals {
  name = "careflow-${var.environment}-${var.region_short}"
  tags = merge(var.tags, { Project="careflow", Environment=var.environment, ManagedBy="terraform", DataClassification="synthetic-healthcare" })
}
module "kms" { source="../../modules/kms"; name="${local.name}-data"; multi_region=true; tags=local.tags }
module "vpc" { source="../../modules/vpc"; name=local.name; cidr=var.vpc_cidr; azs=var.azs; private_subnets=var.private_subnets; public_subnets=var.public_subnets; database_subnets=var.database_subnets; tags=local.tags }
module "eks" { source="../../modules/eks"; name=local.name; vpc_id=module.vpc.vpc_id; subnet_ids=module.vpc.private_subnets; kms_key_arn=module.kms.key_arn; access_entries=var.eks_access_entries; tags=local.tags }
module "aurora" { source="../../modules/aurora"; name="${local.name}-db"; vpc_id=module.vpc.vpc_id; client_cidr=module.vpc.vpc_cidr_block; db_subnet_group_name=module.vpc.database_subnet_group; kms_key_arn=module.kms.key_arn; tags=local.tags }
module "clinical_queue" { source="../../modules/sqs"; name="${local.name}-clinical-events"; kms_key_arn=module.kms.key_arn; tags=local.tags }
module "event_bus" { source="../../modules/eventbridge"; name="${local.name}-events"; target_queue_arn=module.clinical_queue.queue_arn; tags=local.tags }
module "clinical_data" { source="../../modules/s3"; name=var.clinical_data_bucket; kms_key_arn=module.kms.key_arn; object_lock=true; tags=local.tags }
module "patient_api_ecr" { source="../../modules/ecr"; name="careflow/patient-api"; kms_key_arn=module.kms.key_arn; tags=local.tags }
module "worker_ecr" { source="../../modules/ecr"; name="careflow/event-worker"; kms_key_arn=module.kms.key_arn; tags=local.tags }
