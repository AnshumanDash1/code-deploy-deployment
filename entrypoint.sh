#!/bin/bash

echo "the entrypoint.sh file started!"

echo ${INPUT_S3_BUCKET_NAME} : echos the bucket name through input

test_output_inEntryPoint=${INPUT_S3_BUCKET_NAME}
echo $test_output_inEntryPoint : echos bucket name through bash var

aws s3 ls

# echo "::set-output name=test_output_inEntryPoint::$test_output_inEntryPoint"

# echo "testName=test_output_inEntryPoint" >> $GITHUB_OUTPUT
# echo $GITHUB_OUTPUT



