project_id          = "c91-mgmt-network-hub"
region              = "asia-south1"
network_name        = "c91-vpc-prod-shared"

##### App Subnet Details ####
app_subnet_cidr        = "10.108.16.0/20"
app_sc_subnet_cidr_pod = "10.158.0.0/16"
app_sc_subnet_cidr_svc = "10.208.0.0/16"

### Shared Subnet Details ####
web_subnet_cidr        = "10.108.0.0/20"

##### DB Subnet Details ####
db_subnet_cidr = "10.108.32.0/20"

##### Proxy Subnet Details ####
ilb_subnet_cidr = "10.108.48.0/20"

