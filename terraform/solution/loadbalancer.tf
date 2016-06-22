resource "aws_elb" "default" {

  name = "${var.prefix}-elb"
  #depends_on = ["var.internet_gateway_id"]  

  # load balance across all backend avail zones
  cross_zone_load_balancing = true

  security_groups = [
      "${aws_security_group.default.id}",
  ]

  subnets = [
    "${aws_subnet.public-a.id}",
    "${aws_subnet.public-b.id}",
  ]

  listener {
    # port to route to in backend
    instance_port = 80
    instance_protocol = "http"

    # port ELB listens on
    lb_port = 80
    lb_protocol = "http"
  }

  # app instances in rotation on ELB
  instances = [
    "${aws_instance.webhost1.id}",
    "${aws_instance.webhost2.id}",
  ]


  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/index.html"
    interval = 5
  }

  tags {
    Name = "${var.prefix}-elb"
  }
}

output "elb-fqdn" {
    value = "${aws_elb.default.dns_name}"
}

