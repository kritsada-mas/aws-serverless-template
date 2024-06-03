#!/bin/bash

S3_BUCKET="s3-km-test"

# Default parameters
STACK_NAME="km-test"
REGION="us-west-2"
CAPABILITIES="CAPABILITY_IAM CAPABILITY_AUTO_EXPAND"
ENVIRONMENT="dev"

# Build the SAM application
sam build \
  --template ./infrastuctures/main.yaml

# Package the SAM application
sam package \
  --output-template-file packaged.yaml \
  --s3-bucket "$S3_BUCKET" \
  --region "$REGION"

# Deploy the SAM application
sam deploy \
  --template-file packaged.yaml \
  --stack-name "$STACK_NAME" \
  --capabilities $CAPABILITIES \
  --parameter-overrides Environment="$ENVIRONMENT" \
  --region "$REGION" \
  --resolve-s3

