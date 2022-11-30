#!/bin/bash

echo "the entrypoint.sh file started!"


./extract-s3-from-arn.sh

echo $s3_bucket_name : echos the bucket name through input

echo $s3_location : echos bucket name through bash var


aws s3 ls

## start of the code deploy section
deploy_desc=${INPUT_DESCRIPTION_FOR_DEPLOYMENT}
app_name=${INPUT_APPLICATION_NAME}
deploy_name=${INPUT_DEPLOYMENT_GROUP_NAME}
deploy_config_name=${INPUT_DEPLOYMENT_CONFIG_NAME}
bundle_type=${INPUT_BUNDLE_TYPE}


ETAG=`aws s3api head-object --bucket $s3_bucket_name --key $s3_location --query ETag --output text`
aws deploy create-deployment \
  --description $deploy_desc \
  --application-name $app_name \
  --deployment-group-name $deploy_name \
  --deployment-config-name $deploy_config \
  --s3-location bucket=$s3_bucket_name,key=$s3_location,bundleType=$bundle_type,eTag=$ETAG


