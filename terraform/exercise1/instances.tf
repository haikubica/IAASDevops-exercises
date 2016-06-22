resource "aws_instance" "webhost1" {
  ami = "${var.ami_id}" 
  instance_type = "t2.micro"
  tags {
    Name = "${var.prefix}_webhhost1"
  }
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
  }
}

output "webhost1_ip" {
    value = "${aws_instance.webhost1.public_ip}"
}

