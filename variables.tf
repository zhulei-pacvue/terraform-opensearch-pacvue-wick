
variable "cluster-name" { 
    description = "opensearch cluster name"
    type = string
    default = "pacvue-test"
}

variable "cluster-engine_version" { 
    description = "opensearch cluster version"
    type = string
    default = "OpenSearch_2.11"
}

variable "instance_type" { 
    description = "opensearch cluster node numbers"
    type = string
    default = "r6g.large.search"
}

variable "instance_counts" { 
    description = "opensearch cluster node numbers"
    type = number
    default = 2
}
variable "dedicated_master_type" { 
    description = "dedicated_master_type"
    type = string
    default = "m6g.large.search"
}
variable "dedicated_master_enabled_status" {
  description = "dedicated_master_enabled"
  type        = bool
  default     = true
}

variable "availability_zone_counts" { 
    description = "opensearch cluster availability_zone_count"
    type = number
    default = 2
}
variable "zone_awareness_enabled_status" {
  description = "zone_awareness_enabled"
  type        = bool
  default     = true
}


variable "ebs_options_status" {
  description = "ebs_options"
  type        = bool
  default     = true
}

variable "ebs_options_volume_type" { 
    description = "volume type"
    type = string
    default = "gp3"
}

variable "ebs_options_volume_size" { 
    description = "volume_size"
    type = number
    default = 100
}

variable "ebs_options_iops_size" { 
    description = "iops_size"
    type = number
    default = 3000
}
variable "ebs_options_throughput_size" { 
    description = "ebs_options_throughput_size"
    type = number
    default = 125
}

variable "node_to_node_encryption_status" {
  description = "node_to_node_encryption"
  type        = bool
  default     = true
}

variable "encrypt_at_rest_status" {
  description = "encrypt_at_rest"
  type        = bool
  default     = true
}
variable "software_update_options" {
  description = "encrypt_at_rest"
  type        = bool
  default     = false
}

variable "domain_endpoint_options_status" {
  description = "encrypt_at_rest"
  type        = bool
  default     = true
}

variable "advanced_security_options_status" {
    description = "advanced_security_options"
    type = bool
    default =  true
}

variable "internal_user_database_enabled_status" {
    description = "internal_user_database_enabled"
    type = bool
    default =  true
}
variable "anonymous_auth_enabled_status" {
    description = "anonymous_auth_enabled"
    type = bool
    default =  false
}


variable "opensearch_master_user_options" {
    description = "opensearch user"
    type = string
    default = "pacvue"
  
}
variable "opensearch_master_password_options" {
    description = "opensearch password"
    type = string
    default = "eyJhbGciOiJSUzI1NiIsImtpZ-2"
  
}

