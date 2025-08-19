resource "null_resource" "test" {
  triggers = {
    name = var.name
  }
}
