# Minimal test configuration
resource "null_resource" "test" {
  triggers = {
    test_string = var.test_string
    test_bool   = var.test_bool
    test_number = var.test_number
  }
}

output "test_output" {
  description = "Test output"
  value = {
    string_value = var.test_string
    bool_value   = var.test_bool
    number_value = var.test_number
  }
}
