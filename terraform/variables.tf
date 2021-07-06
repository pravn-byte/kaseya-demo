variable "region" { 
  description = "Default Region to store the aws resources"
  default = "us-east-2" 
}
variable "instance_type" { 
  description = "If not input provided for instanc type take t2.micro as default"
  default = "t2.micro" 
}

variable "key_name" { 
  default = "dev-demo-keypair" 
}
