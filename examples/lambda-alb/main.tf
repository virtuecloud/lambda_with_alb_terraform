module "lambda_with_vpc" {
  source = "git::https://github.com/virtuecloud/lambda_with_alb_terraform.git//module"
  lambda_bucket = "tes90090bsdk"
  lambda_function_handler = "lambda_handler"
  lambda_function_name = "test-jahil"
  lambda_memory_size = 512
  lambda_runtime = "python3.8"
  prv_subnet_ids = ["subnet-0bddc98c7c69e0e85", "subnet-03add0f8ff29265d4"]
  vpc_lambda = "vpc-0bcf32041ed04c113"
  pub_subnet_ids = ["subnet-08fe2203accd60344"]
  load_balancer_name = "test-iop"
  target_group_name = "test-target-iop"
  upload_from_s3 = true
  env_vars = {
    name="name1"
  }
  tags = {
    "ENV" = "DEV"
    "Terraform" = "true"
  }
  }
# module "lambda_with_vpc" {
#   source = "git::https://github.com/virtuecloud/lambda_with_alb_terraform.git//module"
#   lambda_bucket = var.s3_bucket_name
#   lambda_function_handler = var.lambda_func_handler
#   lambda_function_name = var.function_name
#   lambda_memory_size = var.function_memory_size
#   lambda_runtime = var.function_runtime
#   prv_subnet_ids = var.private_subnets_ids
#   vpc_lambda = var.vpc_id
#   pub_subnet_ids = var.public_subnets_ids
#   load_balancer_name = var.alb_name
#   target_group_name = var.lb_target_group
#   upload_from_s3 = var.upload_from_s3
#   env_vars = var.env_vars
#   tags = var.tags
#   }















