markdown

# iVolve Training S3 Bucket README

This repository contains instructions for setting up and managing the iVolve Training S3 bucket.

## Table of Contents

1. [Create Bucket](#create-bucket)
2. [Configure Bucket Policy](#configure-bucket-policy)
3. [Upload Files](#upload-files)
4. [Download Files](#download-files)
5. [Enable Versioning](#enable-versioning)
6. [Enable Logging](#enable-logging)

---

## Create Bucket

To create the iVolve Training S3 bucket, run the following command:

```bash
aws s3api create-bucket --bucket ivolve-training --region eu-north-1 --create-bucket-configuration LocationConstraint=eu-north-1



