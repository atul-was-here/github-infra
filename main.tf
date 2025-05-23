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

resource "github_repository" "learning-go" {
 name        = "learning-go"
 description = "My notes and solutions for book Learning Go by Jon Bodner" 
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "aws-workshops" {
 name        = "aws-workshops"
 description = "My notes and solutions for AWS Workshops Implementations" 
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "eloquent-js" {
 name        = "aws-workshops"
 description = "My notes and solutions for Eloquent JS Book" 
 visibility  = "public"
 auto_init   = true
}


resource "github_repository_environment" "repo_environment" {
  repository       = github_repository.aws-workshops.name
  environment      = "test"
}

resource "github_actions_environment_variable" "example_variable" {
  repository       = github_repository.aws-workshops.name
  environment      = github_repository_environment.repo_environment.environment
  variable_name    = "NAME"
  value            = "ATUL"
}