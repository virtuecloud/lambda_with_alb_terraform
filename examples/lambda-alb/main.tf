module "lambda_with_vpc" {
  # source = "git::https://github.com/virtuecloud/lambda_with_alb_terraform.git//module"
  source= "../../module"
  lambda_bucket = var.s3_bucket_name
  lambda_function_handler = var.lambda_func_handler
  lambda_function_name = var.function_name
  lambda_memory_size = var.function_memory_size
  lambda_runtime = var.function_runtime
  prv_subnet_ids = var.private_subnets_ids
  vpc_lambda = var.vpc_id
  pub_subnet_ids = var.public_subnets_ids
  load_balancer_name = var.alb_name
  target_group_name = var.lb_target_group
  upload_from_s3 = var.upload_from_s3
  env_vars = var.env_vars
  tags = var.tags
  ssl_policy_name = var.ssl_policy_name
  certificate_arn = var.certificate_arn
  enable_ssl = var.enable_ssl
  }