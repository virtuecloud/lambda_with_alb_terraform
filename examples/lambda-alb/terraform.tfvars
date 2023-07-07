s3_bucket_name = "example-bucket-name"

lambda_func_handler = "file-name.example-func-handler"   // example in this case hello-python.lambda_handler

function_name = "example-func-name"

function_memory_size = 512

function_runtime = "python3.8"

private_subnets_ids = ["example-pvt-subnet-id"]

vpc_id = "example-vpc-id"

public_subnets_ids = ["example-pub-subnet-id"]

alb_name = "example-alb"

lb_target_group = "example-target-group"

upload_from_s3 = true

env_vars ={
      name = "first"
      second = "22"
    }

tags = {
  "ENV" = "DEV"
  "Terraform" = "true"
}

ssl_policy_name = "ELBSecurityPolicy-2016-08"

certificate_arn = "arnawsiam:187416307283server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

enable_ssl = false

