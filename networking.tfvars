vnets = {
  spoke_aks_re1 = {
    resource_group_key = "reuse"
    region             = "region1"
    vnet = {
      name          = "spoke"
      address_space = ["100.64.48.0/22"]
    }
    specialsubnets = {}
    subnets = {
      aks_nodepool_system = {
        name    = "aks_nodepool_system"
        cidr    = ["100.64.48.0/24"]
        # nsg_key = "azure_kubernetes_cluster_nsg"
      }
      aks_nodepool_portal = {
        name    = "aks_nodepool_portal"
        cidr    = ["100.64.49.0/24"]
        # nsg_key = "azure_kubernetes_cluster_nsg"
      }
      # aks_nodepool_user2 = {
      #   name    = "aks_nodepool_user2"
      #   cidr    = ["100.64.50.0/24"]
      #   nsg_key = "azure_kubernetes_cluster_nsg"
      # }
    }
  }
}