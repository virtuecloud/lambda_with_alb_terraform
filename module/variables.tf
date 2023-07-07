
variable "prv_subnet_ids" {
  description = "This refers to the private subnets in the vpc module"
}
variable "lambda_function_handler" {
  description = "This is the name of the lambda function handler"
}
variable "lambda_function_name" {
  description = "This is the name of the lambda function"
}
  
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

variable "ssl_policy_name" {
  description = "This is the name of your ssl policy"
}

variable "certificate_arn" {
  description = "This is the arn of your ssl certificate"
}

variable "enable_ssl" {
  default = false
  description = "This is a boolean variable when set to true will change the load balancer listener port to 443(HTTPS) and when it is set to false then it will change the load balancer listener port to 80(HTTP)"
}