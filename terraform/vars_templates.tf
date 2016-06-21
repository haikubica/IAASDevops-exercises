# Script templates
resource "template_file" "hello_cgi" {
  template = "${file("data/hello.cgi")}"
}

# config file templates
resource "template_file" "nginx_default" {
  template = "${file("data/default")}"
}

# Configure cloud_init template
resource "template_file" "cloud_init_nginx" {
  template = "${file("cloud_init/nginx.yaml")}"
  vars {
    HELLO_CGI="${base64encode(template_file.hello_cgi.rendered)}"
    NGINX_DEFAULT="${base64encode(template_file.nginx_default.rendered)}"
  }
}
