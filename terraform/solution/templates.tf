# Configure cloud_init template
resource "template_file" "cloud_init_nginx" {
  template = "${file("nginx.yaml")}"
  vars {
    CGI_SCRIPT="${base64encode(file("data/dailyyoda.cgi"))}"
    NGINX_DEFAULT="${base64encode(file("data/default"))}"
  }
}
