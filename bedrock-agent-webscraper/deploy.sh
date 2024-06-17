#!/bin/bash

# Variables
S3_BUCKET="s3-km-test"
STACK_NAME="km-test"
REGION="us-west-2"
CAPABILITIES="CAPABILITY_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM"
ProjectName="km-test"
ENVIRONMENT="dev"

# Upload artifacts to s3
aws s3 cp ./resources/lambda_layers/layer-python-requests-googlesearch-beatifulsoup.zip s3://$S3_BUCKET/layers/layer-python-requests-googlesearch-beatifulsoup.zip
aws s3 cp ./resources/agent_schema/internet-search-schema.json s3://$S3_BUCKET/schemas/internet-search-schema.json
aws s3 cp ./resources/agent_schema/webscraper-schema.json s3://$S3_BUCKET/schemas/webscraper-schema.json


# Build the SAM application
sam build \
  --template ./infrastructures/main.yaml

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
  --parameter-overrides ProjectName="$ProjectName" Environment="$ENVIRONMENT" S3BUCKET="$S3_BUCKET"\
  --region "$REGION" \
  --resolve-s3

# Clean up artifacts
aws s3 rm s3://$S3_BUCKET/layers/layer-python-requests-googlesearch-beatifulsoup.zip
rm -rf .aws-sam
rm packaged.yaml

echo "Cleanup completed!"
