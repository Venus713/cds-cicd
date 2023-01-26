variable "aws_region" {
  default     = "eu-west-2"
  description = "AWS Region"
}

variable "aws_access_key" {
  description = "AWS Access Key ID"
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key"
  sensitive   = true
}

variable "aws_session_token" {
  description = "AWS Session Token"
  sensitive   = true
}

variable "source_account_id" {
  default     = "058464901497"
  description = "Source AWS AccountId"
}
