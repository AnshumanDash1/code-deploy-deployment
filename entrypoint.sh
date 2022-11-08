#!/bin/bash

echo "this is a test"

echo ${INPUT_S3_BUCKET_NAME}

test_output_inEntryPoint=${INPUT_S3_BUCKET_NAME}
echo $test_output_inEntryPoint

# echo "::set-output name=test_output_inEntryPoint::$test_output_inEntryPoint"

echo "{name}={test_output_inEntryPoint}" >> $GITHUB_OUTPUT

echo "Should have a line above this"
