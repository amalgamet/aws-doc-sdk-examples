# Lambda code examples for the AWS SDK for Ruby

## Overview

These code examples demonstrate how to use the AWS SDK for Ruby (v3) to manage and invoke
AWS Lambda functions.

## ⚠️ Important
* Running this code might result in charges to your AWS account.
* Running the tests might result in charges to your AWS account.
*  We recommend that you grant your code least privilege. At most, grant only the minimum permissions required to perform the task. For more information, see [Grant least privilege](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege).
* This code is not tested in every AWS Region. For more information, see [AWS Regional Services](https://aws.amazon.com/about-aws/global-infrastructure/regional-product-services).

## Code examples

### Single action

* [Create a function](lambda_basics.rb)
  (`CreateFunction`)
* [Delete a function](lambda_basics.rb)
  (`DeleteFunction`)
* [Get a function](lambda_basics.rb)
  (`GetFunction`)
* [Invoke a function](lambda_basics.rb)
  (`Invoke`)
* [List functions](lambda_basics.rb)
  (`ListFunctions`)
* [Update function code](lambda_basics.rb)
  (`UpdateFunctionCode`)
* [Update function configuration](lambda_basics.rb)
  (`UpdateFunctionConfiguration`)

### Scenario

* [Get started with functions](scenario_getting_started_functions.rb)

## Running the examples

### Prerequisites

### Get started with functions

This interactive scenario runs at a command prompt and shows you how to use
Lambda to do the following:

1. Create an AWS Identity and Access Management (IAM) role role that grants Lambda
   permission to write to logs.
1. Create a Lambda function and upload handler code.
1. Invoke the function with a single parameter and get results.
1. Update the function code and configure its Lambda environment with an environment
   variable.
1. Invoke the function with new parameters and get results. Display the execution
   log that's returned from the invocation.
1. List the functions for your account.
1. Delete the IAM role and the Lambda function.

Start the scenario at a command prompt.

```
ruby scenario_getting_started_functions.rb
```

### Prerequisites

Prerequisites for running the examples for this service can be found in the
[README](../../README.md#Prerequisites) in the Ruby folder.

## Tests

Instructions for running the tests for this service can be found in the
[README](../../README.md#Tests) in the Ruby folder.

## Additional resources
* [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)
* [AWS Lambda API Reference](https://docs.aws.amazon.com/lambda/latest/dg/API_Reference.html)
* [AWS SDK for Ruby Lambda Client](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Lambda/Client.html)

---

Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

SPDX-License-Identifier: Apache-2.0