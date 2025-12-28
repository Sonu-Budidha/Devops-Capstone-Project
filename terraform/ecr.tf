resource "aws_ecr_repository" "backend" {
  name = "ticket-backend"
}

resource "aws_ecr_repository" "analytics" {
  name = "analytics-service"
}

