resource "github_repository" "github-infra" {
 name        = "github-infra"
 description = "My repository for managing GitHub via Terraform"
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "shell-scripts" {
 name        = "shell-scripts"
 description = "My repository for shell scripts"
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "cs50-python" {
 name        = "cs50-python"
 description = "My notes and solutions for CS50 Python" 
 visibility  = "public"
 auto_init   = true
}