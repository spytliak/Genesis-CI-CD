terraform {
  backend "s3" {
    bucket = "tfstate-project-genesis-dev"
    key    = "genesis/app.tfstate"
    region = "us-east-1"
  }
}