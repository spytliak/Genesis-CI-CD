terraform {
  backend "s3" {
    bucket = "tfstate-project-genesis-t"
    key    = "genesis/app.tfstate"
    region = "us-east-1"
  }
}