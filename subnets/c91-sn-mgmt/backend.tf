terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfsate"
    prefix = "mgmt/networking/subnets/sn-c91-mgmt-ass1"
  }
}