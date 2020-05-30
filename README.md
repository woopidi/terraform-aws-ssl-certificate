# SSL Certificate

```sh
module "example" {
    source          = "git::https://gitlab.woopidi.net/terraform/cloudfront-s3.git"
    domain_name     = "app.example.com"
    zone_id         = "123456"
}
```

## Outputs

```sh
{
    certificate_arn = module.example.certificate_arn
}
```