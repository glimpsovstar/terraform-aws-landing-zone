output "test_variables_output" {
  description = "Output to verify variables are working"
  value = {
    test_string_value = var.test_string
    test_bool_value   = var.test_bool
    test_number_value = var.test_number
  }
}