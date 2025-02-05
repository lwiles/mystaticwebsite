# AWS Route 53 module
Configures the AWS Route 53 records in the selected "hosted zone".

## Variables (Inputs)
- `root-domain`
    - **description:** The primary domain name
    - **type:** `string`
- `www-domain`
    - **description:** Represents the 'www' subdomain
    - **type:** `string`
- `website-bucket-domain`
    - **description:** The website_domain of the s3 bucket containing the website
    - **type:** `string`
- `redirect-bucket-domain`
    - **description:** The website_domain of the s3 bucket that redirects to the website bucket
    - **type:** `string`
- `website-bucket-hosted-zone-id`
    - **description:** The hosted_zone_id of the s3 bucket containing the website
    - **type:** `string`
- `redirect-bucket-hosted-zone-id`
    - **description:** The hosted_zone_id of the s3 bucket that redirects to the website bucket
    - **type:** `string`

## Outputs
None
