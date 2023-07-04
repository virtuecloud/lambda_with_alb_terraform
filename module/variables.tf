# variable "launch_type" {}
# variable "network_type" {}
# variable "operating_system" {}

# variable "alb_type" {}
# variable "target_group_prefix" {}
# variable "backend_protocol" {}
# variable "backend_port" {}
# variable "lb_target_type" {}
# variable "listeners_port" {}
# variable "listeners_protocol" {}
# variable "target_group_index" {}
# # variable "alb_sg_name" {}
# variable "alb_sg_desc" {}
# variable "alb_sg_cidr" {}
# variable "alb_sg_ingress_rules" {}
# variable "alb_sg_engress_rules" {}
# # variable "ecs_sg_name" {}
# variable "ecs_sg_desc" {}
# variable "ecs_sg_ingress_rules" {}
# variable "ecs_sg_egress_rules" {}
# variable "task_cpu" {}  
# variable "task_memory" {}
# variable "ecs_launch_type" {}


/* variable "container_port" {}
variable "ecs_desired_count" {}
variable "alb_name" {}
variable "cert_arn" {}
# variable "cluster_name" {} 
variable "container_name" {} 
variable "ecs_service_name" {}
# variable "container_definition_file" {}
variable "vpc_id" {}
variable "pub_subnet_ids" {}
variable "priv_subnet_ids" {}
variable "cluster_arn" {}
# variable "log_name" {}
# variable "cluster_count" {}
# variable "family_name" {}
variable "internal" {}
variable "image_name" {}
variable "task_environment_variables" {
  default = []
}
variable "env_value" {} */
variable "prv_subnet_ids" {
  description = "This refers to the private subnets in the vpc module"
}
variable "lambda_function_handler" {
  description = "This is the name of the lambda function handler"
}
variable "lambda_function_name" {
  description = "This is the name of the lambda function"
}
# variable "lambda_file_name" {
  
# }
variable "lambda_memory_size" {
  description = "This specifies the amount of memory allocated to the lambda function "
}
variable "lambda_runtime" {
  description = "It specifies the runtime that runs the lambda function's handler methodgit commit"
}
variable "lambda_bucket" {
  description = "This is the name of the s3 bucket"
}

variable "vpc_lambda" {
  description = "This refers to the id of the vpc in the vpc module"
}

 /* variable "repository_name"{} */

variable "pub_subnet_ids" {
  description = "This refers to the public subnets in the vpc module"
}
variable "load_balancer_name" {
  description = "This is the name of the load balancer" 
}
variable "target_group_name" {
  description = "This is the name of the target group"
}

variable "alb_request_methods" {
  description = "The request methods to be created on the ALB."
  type = list(string)
  default = ["OPTIONS", "GET"]
}

variable "env_vars" {
 
}

variable "upload_from_s3" {
description = "Set this to true if you want your file to get uploaded from S3 bucket and set it to false if you want to upload directly from the local"
} 

variable "tags" {
  description = "Tags for resources"
}