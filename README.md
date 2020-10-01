# Terraform GitHub Repository

Terraform modulefor managing GitHub repos and branches

## Implementation

```hcl2
locals {
  public_repos = {
    terraform-github-repository = {
      description = "Terraform module for managing GitHub repositories and branches"
      branches = [
        {
          name                       = "main"
          enforce_admins             = false
          dismissal_teams            = ["engineering"]
          require_code_owner_reviews = false
          reviews_required           = 1
          teams_with_push_access     = ["engineering"]
        }
      ]
    },
  }
}

# ----------------------
# Resource declaration
# ----------------------
module "public_repos" {
  source = "../modules/"
  for_each = local.public_repos

  name        = each.key
  description = each.value.description
  visibility  = "public"

  branch_config = each.value.branches
}
```