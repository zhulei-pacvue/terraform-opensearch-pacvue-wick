
#选a,c两个区
provider "aws" {
  region = "us-west-2"
}


#policy region
data "aws_region" "current" {}
#policy region
data "aws_caller_identity" "current" {}
#policy r
data "aws_iam_policy_document" "example" {
  statement {
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["es:*"]
    resources = ["arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster-name}/*"]
   # condition {
   #   test     = "IpAddress"
   #   variable = "aws:SourceIp"
   #   values   = ["66.193.100.22/32"]
   # }
  }
}

resource "aws_opensearch_domain" "pacvue" {
  domain_name =  var.cluster-name
  engine_version = var.cluster-engine_version

 #1集群规格
  cluster_config {
    instance_type = var.instance_type
    instance_count = var.instance_counts
    dedicated_master_enabled = var.dedicated_master_enabled_status
    dedicated_master_type    = var.dedicated_master_type
    zone_awareness_enabled = var.zone_awareness_enabled_status
    zone_awareness_config {
      availability_zone_count = var.availability_zone_counts  
    }
  }
  #2精细访问控制
  advanced_security_options {
    enabled                        = var.advanced_security_options_status
    internal_user_database_enabled = var.internal_user_database_enabled_status
    anonymous_auth_enabled         = var.anonymous_auth_enabled_status
    master_user_options {
      master_user_name     = var.opensearch_master_user_options
      master_user_password = var.opensearch_master_password_options
    }
  }
  #加密
  encrypt_at_rest {
    enabled = var.encrypt_at_rest_status
  }
  #https
  domain_endpoint_options {
    enforce_https       = var.domain_endpoint_options_status
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  #加密
  node_to_node_encryption {
    enabled = var.node_to_node_encryption_status
  }
 #3ebs规格
  ebs_options {
    ebs_enabled = var.ebs_options_status
    volume_type = var.ebs_options_volume_type
    volume_size = var.ebs_options_volume_size
    iops        = var.ebs_options_iops_size
    throughput  = var.ebs_options_throughput_size
  }
  #vpc
   vpc_options {
    subnet_ids = ["subnet-6b010e12","subnet-f292bbb9"]
    security_group_ids =["sg-0819a050abf915d44"]
  }

  #5访问策略
  access_policies = data.aws_iam_policy_document.example.json
  #软件自动更新
  software_update_options  {
    auto_software_update_enabled = var.software_update_options
  }
  #自动维护



}

