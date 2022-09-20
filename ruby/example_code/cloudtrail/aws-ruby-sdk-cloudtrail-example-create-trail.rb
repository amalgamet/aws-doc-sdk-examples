# frozen_string_literal: true

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

# Purpose:
# aws-ruby-sdk-cloudtrail-example-create-trail.rb demonstrates how to create
# an AWS CloudTrail trail using the AWS SDK for Ruby.

# Inputs:
# - REGION

# snippet-start:[cloudtrail.Ruby.createTrail]
require "aws-sdk-cloudtrail" # v2: require 'aws-sdk'
require "aws-sdk-s3"
require "aws-sdk-sts"

@s3_client = Aws::S3::Client.new
@sts_client = Aws::STS::Client.new
@cloudtrail_client = Aws::CloudTrail::Client.new

trail_name = "example-code-trail-#{rand(10**4)}"
bucket_name = "example-code-bucket-#{rand(10**4)}"

# Attach IAM policy to bucket
# Get account ID using STS
resp = @sts_client.get_caller_identity({})
account_id = resp.account

# Attach policy to an Amazon Simple Storage Service (S3) bucket.
# Replace us-west-2 with the AWS Region you're using for AWS CloudTrail.
@s3_client.create_bucket(bucket: bucket_name)
begin
  policy = {
    "Version" => "2012-10-17",
    "Statement" => [
      {
        "Sid" => "AWSCloudTrailAclCheck20150319",
        "Effect" => "Allow",
        "Principal" => {
          "Service" => "cloudtrail.amazonaws.com"
        },
        "Action" => "s3:GetBucketAcl",
        "Resource" => "arn:aws:s3:::#{bucket_name}"
      },
      {
        "Sid" => "AWSCloudTrailWrite20150319",
        "Effect" => "Allow",
        "Principal" => {
          "Service" => "cloudtrail.amazonaws.com"
        },
        "Action" => "s3:PutObject",
        "Resource" => "arn:aws:s3:::#{bucket_name}/AWSLogs/#{account_id}/*",
        "Condition" => {
          "StringEquals" => {
            "s3:x-amz-acl" => "bucket-owner-full-control"
          }
        }
      }
    ]
  }.to_json

  @s3_client.put_bucket_policy(
    bucket: bucket_name,
    policy:
  )

  puts "Successfully added policy to bucket #{bucket_name}"
end

begin
  @cloudtrail_client.create_trail({
                        name: trail_name, # required
                        s3_bucket_name: bucket_name # required
                      })

  puts "Successfully created CloudTrail #{trail_name} in us-west-2"
rescue StandardError => e
  puts "Got error trying to create trail #{trail_name}:"
  puts e
  exit 1
end
# snippet-end:[cloudtrail.Ruby.createTrail]
