variable "tags" {
  type    = "map"
  default = {}
}

variable "region" {
  type = "string"
}

variable "bucket" {
  type = "string"
}

variable "force_destroy" {
  type    = "string"
  default = "true"
}

variable "dynamo_name" {
  type = "string"
}

variable "read_capacity" {
  type = "string"

  default = 5
}

variable "write_capacity" {
  type = "string"

  default = 5
}
