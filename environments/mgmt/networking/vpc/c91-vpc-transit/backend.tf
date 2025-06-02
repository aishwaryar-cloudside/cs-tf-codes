terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfstate"
    prefix = "mgmt/networking/vpc/c91-vpc-transit"
  }
}