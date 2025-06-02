terraform {
  backend "gcs" {
    bucket = "bkt-cs-mgmt-tfstate"
    prefix = "mgmt/networking/vpc-peering/cs-mgmt-uat-vpc-peering"
  }
}
