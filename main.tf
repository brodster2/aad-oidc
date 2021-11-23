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
      name = "aad-oicd"
    }
  }
}

resource "azuread_group" "github" {
  display_name     = "github"
  security_enabled = true
}
