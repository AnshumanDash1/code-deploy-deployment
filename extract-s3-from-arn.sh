#!/bin/bash
## separating the bucket name and key from full path name:

arn=${INPUT_S3_BUCKET_ARN}
prefix=s3://
pathName=$(echo $arn | sed "s,$prefix,,")

s3_bucket_name=$( echo $pathName | sed 's,/.*,,' )

s3_location=$( echo $pathName | sed "s,$bucket_name\/,," )


