resource "aws_sns_topic" "failed_builds" {
  name = "FailedBuilds"
}

resource "aws_cloudwatch_metric_alarm" "failed_builds" {
  alarm_name          = "FailedBuilds"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "FailedBuilds"
  namespace           = "AWS/CodeBuild"
  period              = "300"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This metric checks for failed builds every 5 minutes"
  alarm_actions       = [aws_sns_topic.failed_builds.arn]
  #CodeBuild provides the following CloudWatch metric dimensions. If none of these are specified, the metrics are for the current AWS account.
  dimensions = {
    #ProjectName #BuildId = "your_projectname_or_buildid_here"
  }
}

# This block exports the SNS topic ARN, which is effectively its unique ID
output "sns_topic_arn" {
  value = aws_sns_topic.failed_builds.arn
}
