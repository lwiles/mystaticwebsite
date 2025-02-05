# AWS Route 53 module
Configures the AWS S3 buckets for a static website and a "www" subdomain redirect bucket.

## Requirements
This module expects a top level "static" directory, containing:
- `index.html`
- `error.html`

## Variables (Inputs)
- `root-domain`
    - **description:** The primary domain name
    - **type:** `string`
- `www-domain`
    - **description:** Represents the 'www' subdomain
    - **type:** `string`

## Outputs
- `website-bucket-domain`
    - **description:** The website_domain of the s3 bucket containing the website
- `redirect-bucket-domain`
    - **description:** The website_domain of the s3 bucket that redirects to the website bucket
- `website-bucket-hosted-zone-id`
    - **description:** The hosted_zone_id of the s3 bucket containing the website
- `redirect-bucket-hosted-zone-id`
    - **description:** The hosted_zone_id of the s3 bucket that redirects to the website bucket
