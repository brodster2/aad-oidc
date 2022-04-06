terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.10.0"
    }
  }
  backend "remote" {
    organization = "jellyfish-republic"

    workspaces {
      name = "aad-oidc"
    }
  }
}

data "azuread_client_config" "current" {}

data "azuread_groups" "list_all" {
  return_all = true
}
