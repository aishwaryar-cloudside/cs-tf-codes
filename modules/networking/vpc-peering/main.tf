resource "google_compute_network_peering" "forward" {
  for_each = { for idx, pair in var.vpc_peering_pairs : idx => pair }

  name         = "peer-${each.value.vpc1}-${each.value.vpc2}"
  network      = "projects/${var.project_id}/global/networks/${each.value.vpc1}"
  peer_network = "projects/${var.project_id}/global/networks/${each.value.vpc2}"
               

  export_custom_routes                = each.value.forward_export_custom_routes
  import_custom_routes                = each.value.forward_import_custom_routes
  export_subnet_routes_with_public_ip = each.value.forward_export_subnet_routes_with_public_ip
  import_subnet_routes_with_public_ip = each.value.forward_import_subnet_routes_with_public_ip
}


# Reverse peering
resource "google_compute_network_peering" "reverse" {
  for_each = { for idx, pair in var.vpc_peering_pairs : idx => pair }

  name         = "peer-${each.value.vpc2}-${each.value.vpc1}"
  network      = "projects/${var.project_id}/global/networks/${each.value.vpc2}"
  peer_network = "projects/${var.project_id}/global/networks/${each.value.vpc1}"

  export_custom_routes                = each.value.reverse_export_custom_routes
  import_custom_routes                = each.value.reverse_import_custom_routes
  export_subnet_routes_with_public_ip = each.value.reverse_export_subnet_routes_with_public_ip
  import_subnet_routes_with_public_ip = each.value.reverse_import_subnet_routes_with_public_ip
}

