variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be deployed."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network to use."
  type        = string
}

variable "env" {
  description = "The environment (e.g., dev, staging, prod) used for naming resources."
  type        = string
}

variable "region_code" {
  description = "The region code used for naming purposes (e.g., us-central1, us-east1)."
  type        = string
}
