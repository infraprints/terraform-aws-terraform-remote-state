data "aws_iam_policy_document" "read" {
  statement {
    sid       = "ListRemoteStateStorage"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.default.arn}/*"]
  }

  statement {
    sid       = "ReadRemoteState"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.default.arn}/*"]
  }

  statement {
    sid       = "ReadWriteLockTable"
    effect    = "Allow"
    actions   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
    resources = [aws_dynamodb_table.default.arn]
  }
}

data "aws_iam_policy_document" "write" {
  statement {
    sid       = "ListRemoteStateStorage"
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.default.arn}/*"]
  }

  statement {
    sid       = "ReadWriteRemoteState"
    effect    = "Allow"
    actions   = ["s3:GetObject", "s3:PutObject"]
    resources = ["${aws_s3_bucket.default.arn}/*"]
  }

  statement {
    sid       = "ReadWriteLockTable"
    effect    = "Allow"
    actions   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
    resources = [aws_dynamodb_table.default.arn]
  }
}
