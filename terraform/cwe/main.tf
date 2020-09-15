module "cwe" {
  source      = "git::https://github.com/cloudmitigator/reflex-engine.git//modules/cwe?ref=v2.1.0"
  name        = "RDSInstanceUnencrypted"
  description = "Rule to detect with an RDS instance is created unencrypted."

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

}
