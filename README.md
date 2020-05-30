# SSL Certificate

```sh
module "example" {
    source = "git@gitlab.woopidi.net:terraform/cloudfront-s3.git"
    domain_name = "app.example.com"
    zone_id = "123456"
}
```

## Output

* certificate_arn
