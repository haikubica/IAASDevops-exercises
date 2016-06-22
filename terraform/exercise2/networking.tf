resource "aws_subnet" "public-a" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "172.31.1${var.uid}.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-west-1a"
    
    tags {
        Name = "${var.prefix}-public-a"
        Type = "public"
    }
}

resource "aws_route_table" "public-a" {
    vpc_id = "${var.vpc_id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${var.internet_gateway_id}"
    }

    tags {
        Name = "${var.prefix}-public-a"
    }
}

resource "aws_route_table_association" "public-a" {
    subnet_id = "${aws_subnet.public-a.id}"
    route_table_id = "${aws_route_table.public-a.id}"
}

output "subnet_a_id" {
    value = "${aws_subnet.public-a.id}"
}

