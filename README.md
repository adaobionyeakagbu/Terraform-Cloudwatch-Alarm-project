# Terraform-Cloudwatch-Alarm-project

This project focuses on creating Cloudwatch Alarms using Terraform.

We'll first create an SNS topic. Amazon Simple Notification Service (Amazon SNS) is a web service that coordinates and manages the delivery or sending of messages to subscribing endpoints or clients.

The created SNS topic will then be utilized by our CloudWatch alarms. The AWS CloudWatch alarm watches the following metrics and sends a notification to the corresponding Amazon SNS topic if the metric goes out a limit specified:

1. Codebuild Failed Builds
