#!/bin/bash
## separating the bucket name and key from full path name:

arn=${INPUT_S3_BUCKET_FULL_PATH}
prefix=s3://
pathName=$(echo $arn | sed "s,$prefix,,")

bucket_name=$( echo $pathName | sed 's,/.*,,' )

key=$( echo $pathName | sed "s,$bucket_name\/,," )

s3_bucket_name=$bucket_name
s3_location=$key
