#!/bin/bash

S3_BUCKET="s3-km-test"
STACK_NAME="km-test"
REGION="us-west-2"

# Delete the SAM application
sam delete \
  --stack-name "$STACK_NAME" \
  --region "$REGION" \
  --s3-bucket "$S3_BUCKET"
