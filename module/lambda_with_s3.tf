
resource "aws_s3_bucket_object" "function" {
  count = var.upload_from_s3 ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id
  key    = "hello-python.zip"
  source = "${path.module}/python/lambda_code/hello-python.zip"
  tags = var.tags
}

data "archive_file" "notifier_package" {
  type        = "zip"
  source_file = "${path.module}/python/lambda_code/hello-python.py"
  output_path = "${path.module}/python/lambda_code/hello-python.zip"
}


resource "aws_lambda_function" "func" {
    # If the file is not in the current working directory you will need to include a
    # path.module in the filename.
    filename      = var.upload_from_s3 ? null : "${path.module}/python/lambda_code/hello-python.zip"
    function_name = var.lambda_function_name
    role          = aws_iam_role.iam_for_lambda.arn
    handler       = var.lambda_function_handler
    runtime       = var.lambda_runtime
    memory_size   = var.lambda_memory_size
    timeout = 3
    s3_bucket = var.upload_from_s3 ? aws_s3_bucket_object.function[0].bucket : null
    s3_key    = var.upload_from_s3 ? aws_s3_bucket_object.function[0].key : null
    
    vpc_config {
      subnet_ids         = var.prv_subnet_ids
      security_group_ids = [aws_security_group.allow_tls.id]
    }

      
     environment {
      
      variables = var.env_vars

      }

      tags = var.tags
       
        }
      
    
     
    
  





resource "aws_s3_bucket" "bucket" {
    count = var.upload_from_s3 ? 1 : 0
    bucket = var.lambda_bucket

    tags = var.tags
}

