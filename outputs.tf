output "table_name" {
  value = aws_dynamodb_table.default.name
}

output "table_id" {
  value = aws_dynamodb_table.default.id
}

output "table_arn" {
  value = aws_dynamodb_table.default.arn
}

output "bucket_id" {
  value = aws_s3_bucket.default.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "bucket_arn" {
  value = aws_s3_bucket.default.arn
}

