Sure, here's a README file for using Ansible dynamic inventory with the provided data:

---

# Ansible Dynamic Inventory for EC2 Instances on AWS

This guide outlines how to set up dynamic inventory in Ansible to manage EC2 instances on AWS. Additionally, it includes instructions for SSH verification and checking the status of Jenkins, Docker, and OpenShift commands on Ubuntu EC2 instances.

## Prerequisites

1. **AWS Account**: You need an AWS account with permissions to create IAM roles, EC2 instances, and manage security groups.
2. **Ansible Installed**: Ensure Ansible is installed on your local machine. You can install it via pip:
   ```
   pip install ansible
   ```
3. **AWS CLI Installed**: You also need the AWS CLI installed to configure your AWS credentials.
4. **IAM Role**: Create an IAM role with appropriate permissions for Ansible to access EC2 instances. Attach the `AmazonEC2ReadOnlyAccess` policy to this role.

## Setup Instructions

### 1. Configure AWS Credentials

Use the AWS CLI to configure your credentials:
```
aws configure
```
Enter your AWS Access Key ID, Secret Access Key, default region, and output format.

### 2. Install Boto3 and Boto

Boto3 and Boto are required for the dynamic inventory script to interact with AWS services. Install them via pip:
```
pip install boto3 boto
```

### 3. Download Dynamic Inventory Script

Download the Ansible dynamic inventory script (`ec2.py`) and its configuration file (`ec2.ini`) from the official Ansible repository:
```
wget https://raw.githubusercontent.com/ansible/ansible/stable-2.10/contrib/inventory/ec2.py
wget https://raw.githubusercontent.com/ansible/ansible/stable-2.10/contrib/inventory/ec2.ini
```

### 4. Configure Dynamic Inventory

Edit the `ec2.ini` file to set your AWS region and the IAM role ARN created earlier.

### 5. Test Dynamic Inventory

Run the dynamic inventory script to ensure it's working properly:
```
./dynamic_inv.py 
```
![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/9c475253-da2f-4330-950a-e752b52b643e)


This command should output a JSON representation of your EC2 instances.

## Run plabook
      ansible-playbook playbook.yaml
   bash

![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/91ad81d3-bf17-432f-ac72-f56fd9bd5e40)



## SSH Verification

To confirm SSH access to an EC2 instance, use the provided SSH image:
![SSH Verification](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/0055b662-3e47-44df-8289-e4d709d0c496)

## Service Status Check

### Jenkins Status

To check Jenkins status on an Ubuntu EC2 instance, refer to the following image:
![Jenkins Status](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/02ed29bb-5a87-4b14-bfd9-8be32947880f)

### Docker Status

To check Docker status on an Ubuntu EC2 instance, refer to the following image:
![Docker Status](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/686c45b7-adec-440f-9305-8c73f8674495)

### OpenShift Command Status

To check OpenShift command status on an Ubuntu EC2 instance, refer to the following image:
![OpenShift Command Status](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/a7938dd2-9873-4f71-b5c6-b030c95c55cf)

## Conclusion

You've successfully set up dynamic inventory for managing EC2 instances on AWS with Ansible. You can now verify SSH access and check the status of services on your instances using the provided instructions and images.

---

