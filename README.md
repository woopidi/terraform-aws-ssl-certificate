# SSL Certificate

```sh
module "example" {
    source          = "git@github.com:woopidi/terraform-aws-ssl-certificate.git"
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