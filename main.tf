resource "github_repository" "shell-scripts" {
 name        = "shell-scripts"
 description = "My repository for shell scripts"
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "github-infra" {
 name        = "github-infra"
 description = "My repository for managing GitHub via Terraform"
 visibility  = "public"
 auto_init   = true
}