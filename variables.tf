# Test module with minimal variables for TFC debugging
variable "test_string" {
  description = "A test string variable"
  type        = string
  default     = "hello-world"
}

variable "test_bool" {
  description = "A test boolean variable"
  type        = bool
  default     = true
}

variable "test_number" {
  description = "A test number variable"
  type        = number
  default     = 42
}
