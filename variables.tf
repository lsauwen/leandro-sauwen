variable "region" {
  description = "Region the instance"
  default     = "us-east-1"
}

variable "name" {
  description = "Application Name"
  default     = "server"
}

variable "env" {
  description = "Environment application"
  default     = "prod"
}

variable "ami" {
  description = "Amazon AMI"
  default     = "ami-04505e74c0741db8d"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "repo" {
  description = "Repository application"
  default     = "https://github.com/SelecaoGlobocom/leandro-sauwen"
}

variable "vpc_id" {
  description = "VPC id"
  default     = "vpc-022d7ad306f149694"

}