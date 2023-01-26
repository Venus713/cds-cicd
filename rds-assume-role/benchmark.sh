#!/bin/bash

echo terraform initializing...
terraform init -input=false

echo terraform planing...
terraform plan -out=tfplan -input=false -var="aws_region=$AWS_DEFAULT_REGION" -var="aws_access_key=$AWS_ACCESS_KEY_ID" -var="aws_secret_key=$AWS_SECRET_ACCESS_KEY" -var="aws_session_token=$AWS_SESSION_TOKEN"

echo terraform applying...
terraform apply -input=false tfplan
