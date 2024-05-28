
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
aws s3api create-bucket --bucket ivolve-training --region eu-north-1
#You must add this option if you create bucket but not in your deafult region--create-bucket-configuration LocationConstraint=eu-north-1

aws s3api put-public-access-block --bucket ivolve-training --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false

```

![1 (2)](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/55065b23-9ac1-4fb8-b29f-46a6ecfa50a7)

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

![2](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/f3e19cfb-828c-42a4-b5ff-8d02e35b90ec)

---

## Upload Files

To upload files to the iVolve Training S3 bucket, run the following command:

```bash
aws s3 cp ~/vimrc s3://ivolve-training/
```

![3](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/c05b4f85-a5b2-4760-bfff-bdb46499be2e)

---

## Download Files

To download files from the iVolve Training S3 bucket, run the following command:

```bash
aws s3 cp s3://ivolve-training/main ~/downs3-ivolve
```

Replace `main` with the name of the file you want to download.

---

## Enable Versioning
Versioning in Amazon S3 is a feature that allows you to keep multiple versions of an object in the same bucket. When you enable versioning for a bucket, Amazon S3 automatically assigns a unique version ID to each new object version.


To enable versioning for the iVolve Training S3 bucket, run the following command:

```bash
aws s3api put-bucket-versioning --bucket ivolve-training --versioning-configuration Status=Enabled
```

---

## Enable Logging
 looging to your bucket allows you to track and analyze access to your objects. This can be valuable for several reasons:

    Auditing: Logging helps in auditing access to your bucket and its objects. You can monitor who accessed which objects and when, which is crucial for compliance and                     security purposes.

    Access Analysis: By analyzing the logs, you can gain insights into how your data is being accessed. This can help you optimize your storage and access patterns.

    Security: Logging can aid in identifying unauthorized access attempts or suspicious activities. It's a crucial component of a comprehensive security strategy for your                 S3 data.

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
![4](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/dfc0e80b-428b-404a-9dcb-530700b90a26)
