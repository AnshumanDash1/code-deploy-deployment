#!/bin/bash

echo "the entrypoint.sh file started!"


## separating the bucket name and key from full path name:

arn=${INPUT_S3_BUCKET_ARN}
prefix=s3://
pathName=$(echo $arn | sed "s,$prefix,,")

s3_bucket_name=$( echo $pathName | sed 's,/.*,,' )

s3_location=$( echo $pathName | sed "s,$bucket_name\/,," )

# testing through echo cmds
echo $s3_bucket_name : echos the bucket name through input

echo $s3_location : echos bucket name through bash var

#testing aws cli 
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


