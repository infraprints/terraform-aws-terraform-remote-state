resource "random_id" "default" {
  byte_length = 6
}

locals {
  bucket = "infraprints-${random_id.default.hex}"
}

module "remote_state" {
  source = "../../"
  bucket = "infraprints-state-${local.bucket}"
  table  = "infraprints-lock-${local.bucket}"
}

resource "aws_iam_role" "terraform" {
  name               = "infraprints-terraform-${local.bucket}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_role_policy" "terraform_policy" {
  name   = "TerraformRemoteState"
  role   = aws_iam_role.terraform.id
  policy = module.remote_state.write_policy
}
