terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfstate"
    prefix = "mgmt/networking/cloudnat/nat-c91-mgmt-apps-ass1-01"
  }
}