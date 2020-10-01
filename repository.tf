resource "github_repository" "this" {
  name        = var.name
  description = var.description

  visibility = var.visibility
  auto_init  = var.auto_init

  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge

  delete_branch_on_merge = var.delete_branch_on_merge
}
