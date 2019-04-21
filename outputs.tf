output "table_name" {
  value = "${aws_dynamodb_table.lock_table.name}"
}

output "table_id" {
  value = "${aws_dynamodb_table.lock_table.id}"
}

output "table_arn" {
  value = "${aws_dynamodb_table.lock_table.arn}"
}

output "bucket_id" {
  value = "${aws_s3_bucket.state_storage.id}"
}

output "bucket_domain_name" {
  value = "${aws_s3_bucket.state_storage.bucket_domain_name}"
}

output "bucket_arn" {
  value = "${aws_s3_bucket.state_storage.arn}"
}
