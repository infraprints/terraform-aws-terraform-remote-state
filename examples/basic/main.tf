module "remote_state" {
  source      = "../../"
  region      = "us-east-1"
  bucket      = "infraprints-terraform-remote-state-basic"
  dynamo_name = "infraprints-terraform-lock-table-basic"
}
