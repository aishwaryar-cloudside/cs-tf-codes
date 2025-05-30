module "vpc_peering" {
  source     = "../../../../../modules/networking/vpc-peering"
  project_id = var.project_id
  vpc_peering_pairs  = var.vpc_peering_pairs
}


