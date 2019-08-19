# AWS Terraform Remote State with Lock Table

Terraform module which creates a terraform remote state storage in S3 with a DynamoDB lock table.

These types of resources are supported:

* [S3 Bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)
* [DynamoDB Table](https://www.terraform.io/docs/providers/aws/r/dynamodb_table.html)

## Usage

```hcl
module "remote_state" {
  source = "git::https://gitlab.com/infraprints/modules/aws/terraform-remote-state"

  bucket = "infraprints-terraform-remote-state"
  table = "infraprints-terraform-lock-table"
}


resource "aws_iam_role" "terraform" {
  name               = "infraprints-terraform"
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
```

## Examples

* [Basic Example](examples/basic)

## Notes

* Only SSL access is permitted to the remote state storage
* Only encrypted objects can be uploaded to the remote state storage
* The lock table is not encrypted

## Inputs

Placeholder.

## Outputs

Placeholder.
