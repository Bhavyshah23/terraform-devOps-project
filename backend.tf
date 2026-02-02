terraform {
  backend "s3" {
    bucket         = "devops-terraform-state-bhavy"
    key            = "ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
