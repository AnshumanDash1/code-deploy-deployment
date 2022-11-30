#!/bin/bash

echo "the entrypoint.sh file started!"

chmod +x extract-s3-from-arn.sh
./extract-s3-from-arn.sh

echo $s3_bucket_name : echos the bucket name through input

echo $s3_location : echos bucket name through bash var

aws s3 ls

# echo "::set-output name=test_output_inEntryPoint::$test_output_inEntryPoint"

# echo "testName=test_output_inEntryPoint" >> $GITHUB_OUTPUT
# echo $GITHUB_OUTPUT



