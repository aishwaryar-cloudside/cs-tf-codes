terraform {
  backend "gcs" {
    bucket = "bkt-card91-mgmt-tfstate"
    prefix = "mgmt/networking/cloudnat/nat-card91-dev-apps-ass1-01"
  }
}