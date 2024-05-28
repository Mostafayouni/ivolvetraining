
```markdown
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
```


---

## Configure Bucket Policy

To configure the bucket policy to allow public read access to objects in the bucket, run the following command:

```bash
aws s3api put-bucket-policy --bucket ivolve-training --policy '{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::ivolve-training/*"
  }]
}'
```

Replace `ivolve-training` with your bucket name.

---

## Upload Files

To upload files to the iVolve Training S3 bucket, run the following command:

```bash
aws s3 cp ~/vimrc s3://ivolve-training/
```

Replace `~/vimrc` with the path to the file you want to upload.

---

## Download Files

To download files from the iVolve Training S3 bucket, run the following command:

```bash
aws s3 cp s3://ivolve-training/main ~/downs3-ivolve
```

Replace `main` with the name of the file you want to download.

---

## Enable Versioning

To enable versioning for the iVolve Training S3 bucket, run the following command:

```bash
aws s3api put-bucket-versioning --bucket ivolve-training --versioning-configuration Status=Enabled
```

---

## Enable Logging

To enable logging for the iVolve Training S3 bucket, run the following command:

Create a JSON file named `logging.json` with the following content:

```json
{
  "LoggingEnabled": {
    "TargetBucket": "ivolve-training",
    "TargetPrefix": "logs/"
  }
}
```

Then run the following command:

```bash
aws s3api put-bucket-logging --bucket ivolve-training --bucket-logging-status file://logging.json
```

Replace `your-logging-bucket-name` with the name of the bucket where you want to store logs.

```

This README file provides instructions for setting up and managing the iVolve Training S3 bucket.
