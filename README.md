# AWS Serverless Template

This repository provides a template for deploying an AWS Serverless application using AWS SAM (Serverless Application Model).

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [AWS CLI](https://aws.amazon.com/cli/)
- [AWS SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html)
- [Python](https://www.python.org/downloads/) (for running the AWS SAM CLI)

## Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kritsada-mas/aws-serverless-template.git
   cd aws-serverless-template
   cd {desired-serverless-pattern}
   ```

2. **Export AWS credentials:**
   Make sure you have your AWS credentials configured. You can either export them directly in your terminal or configure them using the AWS CLI.

   To export credentials:
   ```bash
   export AWS_ACCESS_KEY_ID=your_access_key_id
   export AWS_SECRET_ACCESS_KEY=your_secret_access_key
   export AWS_DEFAULT_REGION=us-west-2
   ```

   Or configure AWS CLI:
   ```bash
   aws configure
   ```

## Deployment

1. **Configure the deployment:**
   Open `deploy.sh` and configure any necessary parameters.

2. **Run the deployment script:**
   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

## Teardown

To delete the stack and all associated resources, run the teardown script:

```bash
chmod +x teardown.sh
./teardown.sh
```

## Folder Structure

- `infrastructures/`: The main SAM template that defines your serverless application.
- `resources/`: Directory containing your resources i.e. Lambda function code, API definition, Stepfunction definition.
- `deploy.sh`: Script to deploy the application.
- `teardown.sh`: Script to delete the deployed stack.

## Customization

You can customize the infrastructures and resources to fit your application's needs.

## Troubleshooting

If you encounter any issues during deployment or teardown, check the following:
- Ensure your AWS credentials are correctly set up and have the necessary permissions.
- Review the CloudFormation stack events in the AWS Management Console for error details.
- Consult the [AWS SAM CLI documentation](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html) for more information on commands and options.

## Additional Resources

- [AWS Serverless Application Model (SAM)](https://aws.amazon.com/serverless/sam/)
- [AWS Lambda](https://aws.amazon.com/lambda/)
- [Amazon API Gateway](https://aws.amazon.com/api-gateway/)