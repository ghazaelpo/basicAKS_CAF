global_settings = {
  default_region = "region1"
  regions = {
    region1 = "eastus"
  }
}

resource_groups = {
  reuse = {
    name  = "learnCAF"
    reuse = true
  }
  # new = {
  #   name = "learnCAF"
  # }
}

aks_clusters = {
  cluster_re1 = {
    name               = "akscluster-re1-001"
    resource_group_key = "reuse"
    os_type            = "Linux"

    identity = {
      type = "SystemAssigned"
    }

    vnet_key = "spoke_aks_re1"

    network_policy = {
      network_plugin    = "azure"
      load_balancer_sku = "standard"
    }

    enable_rbac = true

    admin_groups = {
      # ids = []
      azuread_group_keys = []
    }

    load_balancer_profile = {
      # Only one option can be set
      managed_outbound_ip_count = 1
      # outbound_ip_prefix_ids = []
      # outbound_ip_address_ids = []
    }

    default_node_pool = {
      # name                  = "sharedsvc"
      name                  = "default"
      vm_size               = "Standard_F4s_v2"
      subnet_key            = "aks_nodepool_system"
      enabled_auto_scaling  = false
      enable_node_public_ip = false
      max_pods              = 30
      node_count            = 1
      os_disk_size_gb       = 512
      tags = {
        "project" = "system services"
      }
    }

    node_resource_group_name = "aks-nodes-re1"

    node_pools = {
      pool1 = {
        # name                = "nodepool1"
        name                = "ndportal"
        mode                = "User"
        subnet_key          = "aks_nodepool_portal"
        # subnet_key          = "aks_nodepool_system"
        max_pods            = 30
        vm_size             = "Standard_DS2_v2"
        node_count          = 1
        enable_auto_scaling = false
        os_disk_size_gb     = 512
        tags = {
          "project" = "user services"
        }
      }
    }
  }
}