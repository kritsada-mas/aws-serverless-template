#!/bin/bash

# Variables
S3_BUCKET="s3-km-test"
STACK_NAME="km-test"
REGION="us-west-2"
CAPABILITIES="CAPABILITY_IAM CAPABILITY_AUTO_EXPAND"
ProjectName="km-test"
ENVIRONMENT="dev"
UserPoolArn="YOUR_USER_POOL_ARN"

# Paths
OPENAPI_TEMPLATE="resources/api/openapi.yaml"
OPENAPI_GENERATED="resources/api/openapi-generated.yaml"

# Replace placeholders in openapi.yaml
sed -e "s|\${ProjectName}|${ProjectName}|g" -e "s|\${Environment}|${ENVIRONMENT}|g" -e "s|\${UserPoolArn}|${UserPoolArn}|g" "$OPENAPI_TEMPLATE" > "$OPENAPI_GENERATED"

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
  --parameter-overrides ProjectName="$ProjectName" Environment="$ENVIRONMENT" UserPoolArn="$UserPoolArn" \
  --region "$REGION" \
  --resolve-s3

# Clean up
rm "$OPENAPI_GENERATED"
rm -rf .aws-sam
rm packaged.yaml

echo "Cleanup completed!"
