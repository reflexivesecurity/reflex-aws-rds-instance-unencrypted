# reflex-aws-rds-instance-unencrypted
Rule to detect when RDS instance is created in an unencrypted state.

## Usage
To use this rule either add it to your `reflex.yaml` configuration file:  
```
rules:
  - reflex-aws-rds-instance-unencrypted:
      version: latest
```

or add it directly to your Terraform:  
```
...

module "reflex-aws-rds-instance-unencrypted" {
  source           = "github.com/cloudmitigator/reflex-aws-rds-instance-unencrypted"
}

...
```

## License
This Reflex rule is made available under the MPL 2.0 license. For more information view the [LICENSE](https://github.com/cloudmitigator/reflex-aws-rds-instance-unencrypted/blob/master/LICENSE) 
