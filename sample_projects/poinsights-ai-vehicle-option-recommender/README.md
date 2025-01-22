# Vehicle Option Recommender

## Project Description
The goal of this project is suggest vehicle features based on a specific configuration.
For this purpose, a model is trained and evaluated.
This model is then made available through an API.
Therefore, this project consists of two parts: data and application.

## Prerequisites
This project requires the following tools and frameworks for setup:
- AWS CLI 2.x (see [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))
- Cloud Helper - installs aws_sso, aws_accounts, aws_whoami, and aws_ecr (see [MyPorsche GitHub](https://github.com/myporsche/myct-cloud-helpers/blob/598ec03603b30e2130836ffdaa5cb586cd7944a2/README.md))

## Data
See [Data Readme](model_creation/README.md).

## Application
See [Application Readme](carconfigurator/README.md).

## Included Versions

| Artifact    | Version |
| --------    | ------- |
| Data        | 1.0.2   |
| Application | 1.1.0   |
| API         | 1.0.0   |
