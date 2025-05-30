variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "vpc_peering_pairs" {
  type = list(object({
    vpc1                                = string
    vpc2                                = string
    forward_export_custom_routes        = bool
    forward_import_custom_routes        = bool
    forward_export_subnet_routes_with_public_ip = bool
    forward_import_subnet_routes_with_public_ip = bool
    reverse_export_custom_routes        = bool
    reverse_import_custom_routes        = bool
    reverse_export_subnet_routes_with_public_ip = bool
    reverse_import_subnet_routes_with_public_ip = bool
  }))
}
