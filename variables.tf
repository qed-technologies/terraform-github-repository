#-----------
# Required
#-----------
variable "name" {
  type        = string
  description = "(Required) The name of the repository."
}

variable "branch_config" {
  type        = list(any)
  description = "(Optional) An object defining branch properties for the repository."
}

#-----------
# Optional
#-----------
variable "auto_init" {
  type        = bool
  description = "(Optional) Set to true to produce an initial commit in the repository."
  default     =   true
}

variable "description" {
  type        = string
  description = "(Optional) A description of the repository."
  default     = ""
}

variable "visibility" {
  type        = string
  description = "(Optional) Can be public or private."
  default     = "private"
}

variable "allow_merge_commit" {
  type        = bool
  description = "(Optional) Set to false to disable merge commits on the repository."
  default     = true
}

variable "allow_squash_merge" {
  type        = bool
  description = "(Optional) Set to false to disable squash merges on the repository."
  default     = false
}

variable "allow_rebase_merge" {
  type        = bool
  description = "(Optional) Set to false to disable rebase merges on the repository."
  default     = true
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to false."
  default     = true
}
