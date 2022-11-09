resource "aws_elb" "onemuthoot" {
  name               = var.elb-name
#   availability_zones = var.az
  security_groups = [aws_security_group.onemuth.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.onemuthoot.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 60
  connection_draining         = true
  connection_draining_timeout = 300
}