module "reflex_aws_rds_instance_unencrypted" {
  source           = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe_lambda?ref=v0.6.0"
  rule_name        = "RDSInstanceUnencrypted"
  rule_description = "Rule to detect with an RDS instance is created unencrypted."

  event_pattern = <<PATTERN
{
  "source": [
    "aws.rds"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "rds.amazonaws.com"
    ],
    "eventName": [
      "CreateDBInstance"
    ]
  }
}
PATTERN

  function_name   = "RDSInstanceUnencrypted"
  source_code_dir = "${path.module}/source"
  handler         = "reflex_aws_rds_instance_unencrypted.lambda_handler"
  lambda_runtime  = "python3.7"
  environment_variable_map = {
    SNS_TOPIC = var.sns_topic_arn,
    
  }



  queue_name    = "RDSInstanceUnencrypted"
  delay_seconds = 0

  target_id = "RDSInstanceUnencrypted"

  sns_topic_arn  = var.sns_topic_arn
  sqs_kms_key_id = var.reflex_kms_key_id
}
