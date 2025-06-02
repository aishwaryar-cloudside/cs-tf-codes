terraform {
  backend "gcs" {
    bucket = "bkt-c91-mgmt-tfstate"
    prefix = "mgmt/networking/ha-vpn/ha-vpn-transit-ass1"
  }
}