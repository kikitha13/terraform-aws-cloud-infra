## terraform-aws-cloud-infra

This project creates a complete AWS infrastructure using Terraform, including VPC, subnets, Internet/NAT gateways, EC2 instances in private subnets, ALB, Auto Scaling Group, S3 storage, and remote state management with locking.

---

### 📁 File Structure
```bash
terraform-aws-vpc-ec2-alb-autoscaling/
├── backend.tf         # Remote backend config with S3 + DynamoDB
├── provider.tf        # AWS provider with version constraints
├── main.tf            # All infrastructure resources
├── variables.tf       # Input variables with types and defaults
├── terraform.tfvars   # Values for variables
├── outputs.tf         # Output values like IPs, DNS
├── README.md          # Project documentation (this file)
```

---

### ✅ Features
- VPC with public/private subnets
- Internet Gateway and NAT Gateway
- Launch Template + Auto Scaling Group
- Application Load Balancer
- EC2 instances in private subnets
- S3 bucket for data storage
- Remote backend using S3 & DynamoDB (state locking)
- Lifecycle rules to control resource recreation
- Data sources to fetch latest AMI & default VPC
- Resource dependencies defined using `depends_on`
- Version constraints for reproducibility

---

### 🧾 Requirements
- Terraform v1.3.0 or higher
- AWS CLI configured with credentials
- Pre-created resources:
  - S3 Bucket: `tf-state-kikitha` (versioning enabled)
  - DynamoDB Table: `terraform-locks` with `LockID` as partition key
  - SSH key pair: `my-ec2-key` in selected region

---

### 🛠️ Commands to Run

#### 1. Initialize the Project
```bash
terraform init
```

#### 2. Validate Configuration
```bash
terraform validate
```

#### 3. Preview the Plan
```bash
terraform plan
```

#### 4. Apply the Configuration
```bash
terraform apply
```

#### 5. View State & Resources
```bash
terraform show
terraform state list
```

#### 6. Destroy the Infrastructure
```bash
terraform destroy
```

---

### 📄 Explanation of Files

#### `provider.tf`
- Sets required provider (`aws`) and version constraint.
- Configures AWS region using variable.

#### `backend.tf`
- Configures remote backend using S3 for state and DynamoDB for state locking.

#### `variables.tf`
- Declares all inputs like VPC CIDR, instance type, key name, subnets, etc.

#### `terraform.tfvars`
- Assigns actual values to variables.

#### `main.tf`
- Contains all major resources: VPC, subnets, NAT/IGW, EC2, SG, ALB, Launch Template, ASG, S3.
- Uses `depends_on` and `lifecycle` to control resource flow.
- Uses `data` sources to fetch latest AMI and default VPC.

#### `outputs.tf`
- Displays EC2 public IP and AMI ID after deployment.

---

### 📤 Outputs
- `instance_public_ip`: EC2 instance public IP
- `ami_id`: AMI ID of the instance

---

### 📌 Notes
- Do not manually edit `.tfstate` file.
- Enable versioning on your S3 backend bucket.
- Do not share sensitive values in `terraform.tfvars`.

---

### 🧠 Enhancements
- Add HTTPS with ACM + ALB
- Modularize VPC, EC2, ALB, ASG, and S3 into reusable modules
- Use Terraform Cloud or GitHub Actions for CI/CD
- Add tag propagation for cost management
- Define `validation` on variables for better error feedback

---

### 👤 Author
Ravilla Kikitha  
Terraform AWS Infra Project  
July 2025

---
