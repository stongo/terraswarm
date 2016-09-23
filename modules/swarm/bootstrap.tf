resource "null_resource" "bootstrap" {
  provisioner "local-exec" {
    command = "echo"
  }
}