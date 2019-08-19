variable "bucket" {
  type = string
}

variable "table" {
  type = string
}

variable "force_destroy" {
  type    = string
  default = true
}

variable "read_capacity" {
  type = string
  default = 5
}

variable "write_capacity" {
  type = string
  default = 5
}


variable "tags" {
  type    = map(string)
  default = {}
}
