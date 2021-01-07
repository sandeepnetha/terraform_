variable "vpc"{
    default ="vpc1"
}
variable "name"{
    default = "subnet1"
}
variable "subnet_cidr"{
default = "10.2.0.0/16"
}
variable "region" {
  default = "us-central1"
}
variable "firewall"{
  default ="firewall"
}
variable "projectid"{
default = "essential-tower-270310"
}
variable "zone"{
  default = "us-central1-a"
}
variable "machinetype"{
  default = "e2.medium"
}
variable "instancename"{
  default ="test"
}