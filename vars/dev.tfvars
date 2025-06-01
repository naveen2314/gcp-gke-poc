subnet_name        = "first-sn"
vpc_name           = "first-vpc"
project_id         = "gke-poc-442905"
#network_project_id = "gke-poc-442905"
region             = "us-central1"


cluster_name = "gke-poc-cluster"
cluster_resource_labels = {
  cluster-name          = "gke-poc-cluster"
  type                  = "standard"
  env                   = "dev"
  virtualization-status = "disabled"
}
master_authorized_networks = [
  {
    cidr_block   = "10.0.1.0/24"
    display_name = "first-sn"
  }
]
kubernetes_version                    = "1.31.5-gke.1023000"
release_channel                       = "REGULAR"
horizontal_pod_autoscaling            = true
enable_vertical_pod_autoscaling       = false
non_masquerade_cidrs                  = ["10.0.1.24/24"]
create_service_account                = false
ip_range_pods                         = "pod-range"
ip_range_services                     = "10.2.0.0/24"
remove_default_node_pool              = true
network_policy                        = false
gateway_api_channel                   = "CHANNEL_STANDARD"
enable_intranode_visibility           = true
enable_shielded_nodes                 = true
enable_binary_authorization           = false
fleet_project                         = "gke-poc"
dns_cache                             = true
monitoring_enable_observability_relay = true
enable_fqdn_network_policy            = false
enable_confidential_nodes             = false
master_ipv4_cidr_block                = "172.0.1.0/28"
description                           = "POC cluster"
issue_client_certificate              = false
enable_kubernetes_alpha               = false
default_max_pods_per_node             = 64
identity_namespace                    = "enabled"
gce_pd_csi_driver                     = true
gcs_fuse_csi_driver                   = true
filestore_csi_driver                  = false
security_posture_mode                 = "ENTERPRISE"
security_posture_vulnerability_mode   = "VULNERABILITY_ENTERPRISE"
enable_gcfs                           = true
monitoring_enabled_components         = ["SYSTEM_COMPONENTS", "APISERVER", "SCHEDULER", "CONTROLLER_MANAGER", "STORAGE", "HPA", "POD", "DAEMONSET", "DEPLOYMENT", "STATEFULSET", "KUBELET", "CADVISOR", "DCGM"]
logging_enabled_components            = ["SYSTEM_COMPONENTS", "APISERVER", "CONTROLLER_MANAGER", "SCHEDULER", "WORKLOADS"]

# kube_prometheus_stack = {
#   chart         = "kube-prometheus-stack"
#   name          = "databus"
#   repository    = "https://prometheus-community.github.io/helm-charts"
#   namespace     = "monitoring"
#   chart_version = "61.3.1"
# }

# prometheus_adapter = {
#   chart         = "prometheus-adapter"
#   name          = "prometheus-adapter"
#   repository    = "https://prometheus-community.github.io/helm-charts"
#   namespace     = "monitoring"
#   chart_version = "2.15.1"
# }

# prometheus = {
#   hostname       = "prometheus.kafka.dp-us-databus-dev.viasat.io"
#   cpu            = "2000m"
#   memory         = "8Gi"
#   storage_class  = "standard-custom"
#   volume_size    = "400Gi"
#   retention      = "30d"
#   retention_size = "340GB"
# }

node_pools = [
  {
    name                      = "default-ng"
    version                   = "1.31.5-gke.1169000"
    machine_type              = "e2-medium"
    node_locations            = "us-central1"
    total_min_count           = 1
    total_max_count           = 4
    local_ssd_count           = 0
    preemptible               = false
    local_ssd_ephemeral_count = 0
    disk_size_gb              = 20
    disk_type                 = "pd-standard"
    image_type                = "COS_CONTAINERD"
    enable_gvnic              = true
    auto_repair               = true
    auto_upgrade              = true
    service_account           = "gke-poc@gke-poc-442905.iam.gserviceaccount.com"
    location_policy           = "BALANCED"
    enable_secure_boot        = true
  },
]
# node_pools_oauth_scopes = {
#   all = ["https://www.googleapis.com/auth/cloud-platform"]
# }

# node_pools_labels = {
#   default-ng = {
#     "role" = "default"
#   }
# }

# node_pools_metadata = {
#   all = {
#     block-project-ssh-keys = true
#   }
# }

# node_pools_tags = {
#   all = [
#   ]
# }

# node_pools_taints = {
#   monitoring-ng-us-east4-a-v1 = [
#     {
#       key    = "monitoring"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   monitoring-ng-us-east4-b-v1 = [
#     {
#       key    = "monitoring"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-kafka-dev-us-ng-01 = [
#     {
#       key    = "kafka"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-kafka-dev-us-ng-02 = [
#     {
#       key    = "kafka"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-kafka-dev-us-ng-03 = [
#     {
#       key    = "kafka"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-controller-dev-us-ng-01 = [
#     {
#       key    = "controller"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-controller-dev-us-ng-02 = [
#     {
#       key    = "controller"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
#   databus-controller-dev-us-ng-03 = [
#     {
#       key    = "controller"
#       value  = "true"
#       effect = "NO_SCHEDULE"
#     }
#   ]
# }

# maintenance_start_time       = "2024-10-22T06:00:00Z"
# maintenance_end_time         = "2028-10-30T10:00:00Z"
# maintenance_recurrence       = "FREQ=MONTHLY;BYMONTHDAY=1;INTERVAL=1"
master_global_access_enabled = false
datapath_provider            = "ADVANCED_DATAPATH"
# cluster_autoscaling = {
#   enabled             = false
#   autoscaling_profile = "OPTIMIZE_UTILIZATION"
#   min_cpu_cores       = 4
#   max_cpu_cores       = 86
#   min_memory_gb       = 16
#   max_memory_gb       = 256
#   disk_size           = 100
#   disk_type           = "pd-standard"
#   image_type          = "COS_CONTAINERD"
#   gpu_resources       = []
#   auto_repair         = true
#   auto_upgrade        = true
#   machine_type        = "n2-standard-4"
#   min_count           = 1
#   max_count           = 3
# }

enable_l4_ilb_subsetting = true

