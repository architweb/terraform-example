variable "domain" {
  type        = string
  description = "bucket name and final url"
}

variable "hosting" {
  type        = bool
  description = "Enable static hoting"
  default     = false
}
