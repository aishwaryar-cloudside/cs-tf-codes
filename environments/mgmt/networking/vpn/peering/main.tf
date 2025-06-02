module "tunnel_peer_gateway" {
  source                = "../../../../../modules/networking/vpn/peering"
  project_id            = var.project_id
  region                = var.region
  org                   = var.org
  env                   = var.env
  src                   = var.src
  destination           = var.destination
  region_code           = var.region_code 
  asn                   = "65000"
  cus_rt_psc_range      = ["10.38.0.0/21","10.24.32.0/20","10.30.0.0/21",]
  ike_version           = "2"
  network               = var.network
  external_gateway_name = "${var.org}-peer-gw-${var.env}-aws-gcp-${var.region_code}"
  gateway_name = "ha-vpn-gw-${var.env}-to-${var.destination}-${var.region_code}-01"
  router_name = "${var.org}-cr-${var.env}-aws-gcp-${var.region_code}"


  external_vpn_gateway_interfaces = {
    "0" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-01"
      tunnel_address        = "18.138.177.194"
      vgw_inside_address    = "169.254.46.149"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.46.150/30"
      secret_name         = "vpn-key-gcp-to-aws-ass1-tunnel1"
      vpn_gateway_interface = 0
    },
    "1" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-02"
      tunnel_address        = "54.255.46.151"
      vgw_inside_address    = "169.254.235.57"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.235.58/30"
      secret_name         = "vpn-key-gcp-to-aws-ass1-tunnel2"
      vpn_gateway_interface = 0
    },
    "2" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-03"
      tunnel_address        = "13.251.22.83"
      vgw_inside_address    = "169.254.220.45"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.220.46/30"
      secret_name           = "vpn-key-gcp-to-aws-ass1-tunnel3"
      vpn_gateway_interface = 1
    },
    "3" = {
      router_int_name       = "${var.org}-cr-if-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      router_peer_name      = "${var.org}-cr-peer-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      name_tunnel           = "${var.org}-vpn-tn-${var.env}-${var.src}-${var.destination}-${var.region_code}-04"
      tunnel_address        = "54.151.232.131"
      vgw_inside_address    = "169.254.228.45"
      asn                   = var.vir_pvt_gat_asn
      cgw_inside_address    = "169.254.228.46/30"
      secret_name           = "vpn-key-gcp-to-aws-ass1-tunnel4"
      vpn_gateway_interface = 1
    },
  }
}