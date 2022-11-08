#!/bin/bash

echo "this is a test"

echo ${INPUT_S3_BUCKET_NAME}

echo "::set-output name=test_output::${INPUT_TEST_OUTPUT}"

echo "Should have a line above this"
