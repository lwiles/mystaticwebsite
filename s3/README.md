# AWS Route 53 module
Configures the AWS S3 buckets for a static website and a "www" subdomain redirect bucket.

## Variables (Inputs)
- `root-domain`
- `www-domain`

## Outputs
- `website-bucket-domain`
- `website-bucket-hosted-zone-id`
- `redirect-bucket-domain`
- `redirect-bucket-hosted-zone-id`