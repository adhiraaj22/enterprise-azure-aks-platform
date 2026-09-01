location = "Central India"


rgs = {
  rg_001 = {
    name     = "rg-dev-platform-001"
    location = "Central India"
  }
}


network = {
  name          = "vnet-platform-dev-001"
  address_space = ["10.0.0.0/16"]
}


subnets = {

  aks = {

    name = "snet-aks"

    address_prefixes = [
      "10.0.1.0/24"
    ]

    nsg = {

      name = "nsg-aks"

      security_rules = {}

    }
  }


  appgw = {

    name = "snet-appgw"

    address_prefixes = [
      "10.0.2.0/24"
    ]

    nsg = {

      name = "nsg-appgw"

      security_rules = {

        # Public ingress is intentional because Application Gateway is the public entry point.
        #tfsec:ignore:azure-network-no-public-ingress
        allow_http = {

          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "80"
          source_address_prefix      = "*"
          destination_address_prefix = "*"

        }

        allow_appgw_management = {
          priority                   = 120
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "65200-65535"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }

        # Public ingress is intentional because Application Gateway is the public entry point.
        #tfsec:ignore:azure-network-no-public-ingress
        allow_https = {

          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "*"
          destination_address_prefix = "*"

        }
      }
    }
  }

  private = {

    name = "snet-private"

    address_prefixes = [
      "10.0.3.0/24"
    ]

    nsg = {

      name = "nsg-private"

      security_rules = {}

    }
  }
}


route_tables = {

  aks = {

    name = "rt-aks"

    routes = {

      internet = {

        address_prefix = "0.0.0.0/0"
        next_hop_type  = "Internet"

      }
    }
  }
}


log_analytics_workspace_name = "law-platform-dev-001"

acr_name = "acrplatformdev001"

managed_identity_name = "id-platform-dev-001"

aks_name = "aks-platform-dev-001"

dns_prefix = "aks-platform-dev"

kubernetes_version = null


system_node_pool = {

  vm_size = "Standard_B2s_v2"

  node_count = 1

  min_count = 1

  max_count = 2

  os_disk_size_gb = 30

  max_pods = 30

}


user_node_pool = {

  name = "usernp"

  vm_size = " Standard_B2s_v2"

  node_count = 1

  min_count = 1

  max_count = 2

  os_disk_size_gb = 30

  max_pods = 30

}


api_server_authorized_ip_ranges = [
  "122.161.76.48/32"
]


keyvault_name = "kvplatformdev001_ady"

appgw_name = "agw-platform-dev-001"


postgresql_server_name   = "psql-platform-dev-001"
postgresql_database_name = "todoapp"
postgresql_admin_login   = "pgadmin"
