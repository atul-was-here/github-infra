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

resource "github_repository" "python-scripts" {
 name        = "python-scripts"
 description = "My repository for python scripts"
 visibility  = "public"
 auto_init   = true
}

resource "github_repository" "eloquent-js" {
 name        = "eloquent-js"
 description = "My repository for eloquent-js solutions"
 visibility  = "public"
 auto_init   = true
}


resource "github_repository" "gh_workflows_test" {
 name        = "gh-workflows-test"
 description = "My repository for testing github action workflows"
 visibility  = "public"
 auto_init   = true
}


data "github_user" "current" {
  username = "atul-was-here"
}

locals {
  key_rotation_test_environments =  ["dev", "qa", "production"]
}

resource "github_repository_environment" "key_rotation_test_environment" {
  count = length(local.key_rotation_test_environments)
  environment         = local.key_rotation_test_environments[count.index]
  repository          = github_repository.gh_workflows_test.name
  prevent_self_review = false
  reviewers {
    users = [data.github_user.current.id]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

