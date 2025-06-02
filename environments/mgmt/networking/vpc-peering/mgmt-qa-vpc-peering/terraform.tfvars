project_id = "cs-mgmt-apps"

vpc_peering_pairs = [
  {
    vpc1 = "cs-vpc-mgmt-shared"
    vpc2 = "cs-vpc-qa-shared"
    forward_export_custom_routes        = true
    forward_import_custom_routes        = true
    forward_export_subnet_routes_with_public_ip = true
    forward_import_subnet_routes_with_public_ip = false
    reverse_export_custom_routes        = true
    reverse_import_custom_routes        = true
    reverse_export_subnet_routes_with_public_ip = true
    reverse_import_subnet_routes_with_public_ip = false
  }
]


