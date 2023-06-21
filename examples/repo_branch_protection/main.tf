resource "github_repository" "test" {
  name        = "test42"
  visibility  = "private"
  description = "A collaborative repository"
}

resource "github_branch_protection" "master" {
  repository_id          = github_repository.test.node_id
  pattern                = "master"

   required_pull_request_reviews {
    pull_request_bypassers = [
      "/bpaquet"
    ]
    require_code_owner_reviews = false
  }
}