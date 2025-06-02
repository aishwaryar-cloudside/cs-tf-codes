variable "project_id" {
  type        = string
  description = "project of the resource"
}

variable "region" {
  type        = string
  description = "region of the resource"
}
variable "vir_pvt_gat_asn" {
  type        = number
  description = "Virtual private gateway asn number from downloaded vpn configuration file"
  default     = "65531" 
}

variable "org" {}

variable "env" {}

variable "region_code" {}


variable "destination" {
  default = "aws-uat"
}

variable "src" {
  default = "gcp"
}

variable "network" {}