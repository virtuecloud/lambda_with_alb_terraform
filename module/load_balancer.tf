resource "aws_lb_target_group" "main" {
  name     = var.target_group_name
  port     = var.enable_ssl ? 443 : 80
  protocol = var.enable_ssl ? "HTTPS" : "HTTP"
  vpc_id   = var.vpc_lambda
  target_type = "lambda"
  # health_check {
  #   enabled  = true
  #   protocol = var.enable_ssl ? "HTTPS" : "HTTP"
  #   matcher = "200-499"
  # }

  tags = var.tags
}

resource "aws_lambda_alias" "live" {
  name = "live"
  description = "Live alias"
  function_name = aws_lambda_function.func.arn
  function_version = aws_lambda_function.func.version
}

resource "aws_lb" "main" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"

   subnets = var.pub_subnet_ids
   security_groups = [module.alb-sg.security_group_id]

  tags = var.tags
  
}
resource "aws_lambda_permission" "alb" {
  statement_id = "AllowExecutionFromALB"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.function_name
  principal = "elasticloadbalancing.amazonaws.com"
  source_arn = aws_lb_target_group.main.arn
}
resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id = aws_lambda_alias.live.function_name
  depends_on = [ aws_lambda_permission.alb ]
}
resource "aws_lb_listener" "main" {
  count = var.enable_ssl ? 0 : 1
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
   
  tags = var.tags
}

resource "aws_lb_listener" "redirect_to_https" {
  count = var.enable_ssl ? 1 : 0
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

 default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = var.tags
}

resource "aws_lb_listener" "main_https" {
  count = var.enable_ssl ? 1 : 0
  load_balancer_arn = aws_lb.main.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy_name
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
  tags = var.tags
}