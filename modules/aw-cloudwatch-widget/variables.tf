variable "name" {
  type = string
}

variable "width" {
  type    = number
  default = 12
}

variable "height" {
  type    = number
  default = 6
}

variable "region" {
  type = string
}

variable "resource_id" {
  type    = string
}


variable "type" {
  type    = string
  default = "ec2"
}

