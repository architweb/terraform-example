variable "name" {
  type = string
}

variable "static_ip" {
  type        = bool
  description = "Add Static IP"
  default     = false
}

variable "ami_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "type" {
  type    = string
  default = "t3.micro"
}

variable "ssh_key_name" {
  type    = string
}

variable "subnet_id" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 8
}
