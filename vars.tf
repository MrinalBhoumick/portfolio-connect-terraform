# Specify the AWS region
variable "AWS_REGION" {
  default = "ap-south-1"
}

#-------------------------Variables For Autoscaling---------------------
variable "autoscaling_group_min_size" {
  type    = number
  default = 1
}
variable "autoscaling_group_max_size" {
  type    = number
  default = 2
}
#-------------------------Fetch AMI ID---------------------
data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
