terraform {
  required_version = ">= 0.13.5"
}

terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
