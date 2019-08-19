resource "random_id" "default" {
  byte_length = 6
}

locals {
  bucket = "infraprints-${random_id.default.hex}"
}

module "remote_state" {
  source      = "../../"
  region      = "us-east-1"
  bucket      = "infraprints-state-${local.bucket}"
  dynamo_name = "infraprints-lock-${local.bucket}"
}
