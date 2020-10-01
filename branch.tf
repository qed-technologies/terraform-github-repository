resource "github_branch" "this" {
  # The main branch is created by default when 
  # `github_repository.auto_init = true`
  # So if a main branch is specifiec as part of `var.branch_config` 
  # we want to exclude it from this resource because it alread exists
  for_each = { for branch in var.branch_config: branch.name => branch if branch.name != "main" }

  repository    = github_repository.this.name
  branch        = each.key
}

resource "github_branch_protection" "this" {
  for_each = { for branch in var.branch_config: branch.name => branch }

  repository     = github_repository.this.name
  branch         = each.key
  enforce_admins = lookup(each.value, "enforce_admins", true)

  required_pull_request_reviews {
    dismiss_stale_reviews           = lookup(each.value, "dismiss_stale_reviews", true)
    dismissal_teams                 = lookup(each.value, "dismissal_teams", [])
    require_code_owner_reviews      = lookup(each.value, "require_code_owner_reviews", false)
    required_approving_review_count = lookup(each.value, "reviews_required", null)
  }

  restrictions {
    users = lookup(each.value, "users_with_push_access", [])
    teams = lookup(each.value, "teams_with_push_access", [])
    apps  = lookup(each.value, "apps_with_push_access", [])
  }

  depends_on = [github_branch.this]
}
