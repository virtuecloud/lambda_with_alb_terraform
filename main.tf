module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "stage_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true
}

module "lambda_with_vpc" {
  source = "./module"
  lambda_bucket = "tes900000"
  lambda_file_handler = "hello-python.lambda_handler"
  lambda_file_name = "${path.module}/module/python/hello-python.py.zip"
  lambda_function_name = "test-lambda"
  lambda_memory_size = 512
  lambda_runtime = "python3.8"
  prv_subnet_ids = module.vpc.private_subnets
  vpc_lambda = module.vpc.vpc_id
  pub_subnet_ids = module.vpc.public_subnets
  load_balancer_name = "new-lambda"
  target_group_name = "lambda-trg"

  env_vars = {
      name = "first"
      second = "22"
    }
  }

