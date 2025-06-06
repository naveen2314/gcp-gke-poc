module "gke_enterprise" {
  #source = "git::https://github.com/naveen2314/gke-module.git?ref=v1.0.0"
  source = "terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster"


  #using beta private cluster module because it has additional features like secret manager addon and fqdn network policy. 
  version    = "=33.0.0"
  project_id = var.project_id
  zones      = ["us-central1-a", "us-central1-b", "us-central-c"] # Immutable
  regional   = true                                               # Immutable
  region     = var.region                                         # Immutable
  network    = var.vpc_name                                       # Immutable
  #network_project_id                      = var.network_project_id                     # Immutable
  subnetwork                              = var.subnet_name  # Immutable
  name                                    = var.cluster_name # Immutable
  deletion_protection                     = false
  cluster_resource_labels                 = var.cluster_resource_labels
  non_masquerade_cidrs                    = var.non_masquerade_cidrs
  ip_range_pods                           = var.ip_range_pods     # Immutable for default
  ip_range_services                       = var.ip_range_services # Immutable
  http_load_balancing                     = true
  enable_private_endpoint                 = true # Immutable
  master_authorized_networks              = var.master_authorized_networks
  deploy_using_private_endpoint           = true
  enable_private_nodes                    = true                       # Immutable
  master_ipv4_cidr_block                  = var.master_ipv4_cidr_block # Immutable
  kubernetes_version                      = var.kubernetes_version
  release_channel                         = var.release_channel
  horizontal_pod_autoscaling              = var.horizontal_pod_autoscaling
  enable_vertical_pod_autoscaling         = var.enable_vertical_pod_autoscaling
  create_service_account                  = var.create_service_account
  network_policy_provider                 = var.network_policy_provider == true ? var.network_policy_provider : null
  remove_default_node_pool                = var.remove_default_node_pool
  node_pools                              = var.node_pools
  node_pools_oauth_scopes                 = var.node_pools_oauth_scopes
  node_pools_labels                       = var.node_pools_labels
  node_pools_metadata                     = var.node_pools_metadata
  node_pools_tags                         = var.node_pools_tags
  node_pools_taints                       = var.node_pools_taints
  maintenance_start_time                  = var.maintenance_start_time
  maintenance_end_time                    = var.maintenance_end_time
  maintenance_recurrence                  = var.maintenance_recurrence
  master_global_access_enabled            = var.master_global_access_enabled
  enable_intranode_visibility             = var.enable_intranode_visibility
  enable_shielded_nodes                   = var.enable_shielded_nodes
  enable_binary_authorization             = var.enable_binary_authorization
  fleet_project                           = var.fleet_project
  default_max_pods_per_node               = var.default_max_pods_per_node # Immutable
  enable_secret_manager_addon             = true                          #beta-private-cluster feature
  identity_namespace                      = var.identity_namespace        #for workload identity
  datapath_provider                       = var.datapath_provider         # Immutable #For dataplane V2 feature
  dns_cache                               = var.dns_cache
  gateway_api_channel                     = var.gateway_api_channel
  gke_backup_agent_config                 = true
  monitoring_enable_managed_prometheus    = true
  monitoring_enable_observability_metrics = true
  monitoring_enable_observability_relay   = var.monitoring_enable_observability_relay
  enable_fqdn_network_policy              = var.enable_fqdn_network_policy #beta-private-cluster feature
  cluster_autoscaling                     = var.cluster_autoscaling
  enable_confidential_nodes               = var.enable_confidential_nodes # Immutable
  description                             = var.description               # Immutable
  issue_client_certificate                = var.issue_client_certificate  # Immutable
  enable_kubernetes_alpha                 = var.enable_kubernetes_alpha   # Immutable
  network_policy                          = var.network_policy            #don't need to enable network policy in clusters that use GKE Dataplane V2
  gce_pd_csi_driver                       = var.gce_pd_csi_driver
  gcs_fuse_csi_driver                     = var.gcs_fuse_csi_driver
  filestore_csi_driver                    = var.filestore_csi_driver
  security_posture_mode                   = var.security_posture_mode
  security_posture_vulnerability_mode     = var.security_posture_vulnerability_mode
  enable_cost_allocation                  = true
  enable_gcfs                             = var.enable_gcfs
  monitoring_enabled_components           = var.monitoring_enabled_components
  logging_enabled_components              = var.logging_enabled_components
  configure_ip_masq                       = true
  workload_config_audit_mode              = "BASIC"
  enable_l4_ilb_subsetting                = var.enable_l4_ilb_subsetting
}
