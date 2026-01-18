 CREATE OR REPLACE STORAGE INTEGRATION tableau_Integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::411304300734:role/tableau.role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://tableau-project-411304300734/')
  COMMENT = 'Optional Comment'


  //description Integration Object
  desc integration tableau_Integration