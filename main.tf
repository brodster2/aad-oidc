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
resource "azuread_group" "github" {
  display_name     = "github"
  security_enabled = true
  owners           = [data.azuread_client_config.current.object_id]
}
