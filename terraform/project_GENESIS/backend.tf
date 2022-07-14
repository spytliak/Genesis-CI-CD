terraform {
  backend "s3" {
    bucket = "tfstate-project-genesis-sp"
    key    = "genesis/app.tfstate"
    region = "us-east-1"
  }
}