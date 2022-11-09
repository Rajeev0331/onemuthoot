variable "elb-name" {
  description = "Name to be used on load balancer"
  type        = string
  default     = "onemuthootclb"
}

variable "ami-id" {
  description = "AMI to be used on ec2 instance"
  type        = string
  default     = "ami-09d3b3274b6c5d4aa"
}

variable "instance" {
  description = "ec2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key" {
  description = "key for ec2 instance"
  type        = string
  default     = "onemuthoot"
}

variable "az" {
  description = "A list of az"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidrpub1" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "cidrpub2" {
  type        = string
  default     = "10.0.2.0/24"
}

variable "cidrpr1" {
  type        = string
  default     = "10.0.3.0/24"
}

variable "cidrpr2" {
  type        = string
  default     = "10.0.4.0/24"
}

variable "az1" {
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  type        = string
  default     = "us-east-1b"
}