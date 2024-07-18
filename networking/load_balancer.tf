resource "aws_lb" "main" {
  name               = "web-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security_group.lb_sg_id]
  subnets            = module.networking.public_subnets

  enable_deletion_protection = true
}

resource "aws_lb_target_group" "web_app_tg" {
  name     = "web-app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.networking.vpc_id
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_tg.arn
  }
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_app_tg.arn
  }
}
