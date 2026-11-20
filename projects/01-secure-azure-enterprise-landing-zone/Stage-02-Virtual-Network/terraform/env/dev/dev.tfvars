# --------------------------------------------------
# STAGE 01 - AZURE RESOURCE GROUP
# --------------------------------------------------

resource_group_name = "tf-dev-rg"
location            = "uksouth"

tags = {
  Environment = "dev"
  Project     = "terraform-azure"
  ManagedBy   = "Terraform"
}

# --------------------------------------------------
# STAGE 02 - AZURE VIRTUAL NETWORK
# --------------------------------------------------

vnet_name     = "dev-uks-vnet"
address_space = ["10.10.0.0/16"]