#!/bin/bash

echo "the entrypoint.sh file started!"

echo ${INPUT_S3_BUCKET_NAME} : echos the bucket name through input

test_output_inEntryPoint=${INPUT_S3_BUCKET_NAME}
echo $test_output_inEntryPoint : echos bucket name through bash var

# echo "::set-output name=test_output_inEntryPoint::$test_output_inEntryPoint"

# echo "testName=test_output_inEntryPoint" >> $GITHUB_OUTPUT
# echo $GITHUB_OUTPUT

## start of the code deploy section
s3_bucket_name=${INPUT_S3_BUCKET_NAME}
s3_location=${INPUT_S3_BUCKET_LOCATION}
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
  
  echo "entrypoint.sh file finished."

