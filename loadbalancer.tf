resource "aws_elb" "desafio" {
  name               = "elb-desafio-terraform"
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  instances                   = [aws_instance.server[0].id, aws_instance.server[1].id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "desafio-terraform-elb"
  }
}