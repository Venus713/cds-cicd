provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_session_token
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.source_account_id}:root"]
    }
  }
}

data "aws_iam_policy" "ec2" {
  name     = "AmazonEC2FullAccess"
}

data "aws_iam_policy" "vpc" {
  name     = "AmazonVPCCrossAccountNetworkInterfaceOperations"
}

resource "aws_iam_role" "assume_role" {
  name                = "cds_rds_assume_role"
  assume_role_policy  = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = [data.aws_iam_policy.ec2.arn, data.aws_iam_policy.vpc.arn]
}
