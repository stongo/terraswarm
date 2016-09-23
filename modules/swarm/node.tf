resource "null_resource" "discovery_token" {
  provisioner "local-exec" {
    command = "curl https://discovery.etcd.io/new?size=${var.node_count} > ${path.module}/.token"
  }
}

resource "template_file" "cloud_config" {
  depends_on = ["null_resource.discovery_token"]
  count = "${var.node_count}"
  template = "${file("${path.module}/templates/cloud-config.yaml")}"
  vars {
    name = "${format("swarm-%02d", count.index + 1)}"
    discovery_token = "${file("${path.module}/.token")}"
    node_count = "${var.node_count}"
  }
}
