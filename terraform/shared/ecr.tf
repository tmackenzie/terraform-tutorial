resource "aws_ecr_repository" "my_first_ecr_repo" {
  name = "my-first-ecr-repo"
  image_tag_mutability = "MUTABLE"
}
