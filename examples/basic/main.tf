module "label" {
  source = "git::https://gitlab.com/infraprints/modules/terraform-terraform-unique-label"

  namespace  = "Infraprints"
  stage      = "proto"
  name       = "terraform"
  attributes = ["remote", "storage"]
}

module "remote_state" {
  source = "../../"
  bucket = module.label.id
  table  = module.label.id
}


resource "aws_iam_role" "terraform" {
  name               = module.label.id
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
