
resource "aws_s3_bucket_object" "function" {
  bucket = aws_s3_bucket.bucket.id
  key    = "hello-python.zip"
  source = var.lambda_file_name
}




resource "aws_lambda_function" "func" {
    # If the file is not in the current working directory you will need to include a
    # path.module in the filename.
    //filename      = var.lambda_file_name
    function_name = var.lambda_function_name
    role          = aws_iam_role.iam_for_lambda.arn
    handler       = var.lambda_file_handler
    runtime       = var.lambda_runtime
    memory_size   = var.lambda_memory_size
    timeout = 3
    s3_bucket = aws_s3_bucket_object.function.bucket
    s3_key    = aws_s3_bucket_object.function.key
    
    vpc_config {
      subnet_ids         = var.prv_subnet_ids
      security_group_ids = [aws_security_group.allow_tls.id]
    }
    depends_on = [
      aws_s3_bucket.bucket
    ]
    # dynamic "environment" {
    #   for_each = var.env_vars
    #   variables = {
    #     environment.key=environment.value
    #   }
     
     environment {
      
      variables = var.env_vars

      }
       
        }
      
    
     
    
  





resource "aws_s3_bucket" "bucket" {
  bucket = var.lambda_bucket
}

