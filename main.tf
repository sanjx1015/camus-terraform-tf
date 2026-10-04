terraform {
    required_providers{
        tfe = {
            source = "hasicorp/tfe"
            version  = "~> 0.50"
        }
    }
}

provider "tfe"{}

resource "tfe_project" "github_project"{
    name = "camus-github-project"
    organization = "camus-terraform"
}

resource "tfe_workspace" "github_workspace"{
    name = "camus-github"
    organization = "camus-labs-terraform"
    project_id = tfe_project.github_project.id


    vcs_repo {
        identifier = "sanjx1015/camus-github-tf"
        branch = "main"
        oauth_token_id = var.github_oauth_token__id
        
    }
}