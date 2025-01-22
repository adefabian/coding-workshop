# Vehicle Option Recommender - Application

## Project Description
This module creates the infrastructure and endpoints for accessing the Vehicle Option Recommender service.
The service takes requests, processes them with the help of the trained model, and sends back the response.
For more information see [Confluence](https://confluence.porsche.codes/x/2AnLCQ).

## Prerequisites
This application part of this project requires additionally the following tools and frameworks for setup:
- Java SDK 11.x (for local testing, install with brew using ```brew reinstall openjdk@11```)
- Gradle 6.x (for local testing, install with brew using ```brew install gradle@6```)
- cdk ```npm install aws-cdk-lib```

## Local testing
To test the Java Application locally, you can either use gradle directly by executing ```gradle bootRun``` and then firing requests against ```http://localhost:8884``` (takes around 3 minutes to launch it, wait for "Started CarConfiguratorApplication in xxx.xxx seconds". Assumes that you are logged in with aws_sso first). 

The other option is to build the Docker image manually using ```gradle jibDockerBuild```, then launch it with ```docker run --rm -it -p 8884:8884 --env AWS_SECRET_KEY="PUT_IAM_CREDENTIALS_HERE" --env AWS_ACCESS_KEY_ID="PUT_IAM_CREDENTIALS_HERE" 164646797090.dkr.ecr.eu-central-1.amazonaws.com/null.pag.service.icc.recommendations:v1.0.10```. This assumes that you create an IAM user first.

## Setup
The application is automatically deployed when pushing to the repository.
A manual deployment from the local machine can be performed by running ```cdk deploy``` from the corresponding folders. See deployment YAMLs

## Usage
See [Porsche Developer Portal](https://developer.porsche-preview.com/docs/poinsightsai-icc-reco-preview/1/overview).

## Release Notes

### v1.1.0

#### New Features
- Add periodic E2E API check [INSIGHTSAI-1602](https://jira.porsche.codes/browse/INSIGHTSAI-1602)
- Remove obsolete slack notifications [INSIGHTSAI-1269](https://jira.porsche.codes/browse/INSIGHTSAI-1269)

#### Bugfixes

#### Dependency Updates

--------------------------------

### v1.0.0

#### New Features
- Update CloudWatch dashboard and add alarms [INSIGHTSAI-1597](https://jira.porsche.codes/browse/INSIGHTSAI-1597)

#### Bugfixes

#### Dependency Upgrades
