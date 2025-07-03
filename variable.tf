variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ec2_default_root_storage_size" {
  default = "10"
  type    = number
}

variable "ec2_emi_id" {
  default = "ami-0f4f4482537714bd9" #linux
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}
