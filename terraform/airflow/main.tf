terraform {
  backend s3 {
      bucket = "quero2pay-terraform-states"
      key = "orchestration-stack.tfstate"
      region = "sa-east-1"
      profile = "q2p" # default: quero2pay
  }

  required_providers {
    aws = {
      version = "~> 3.45"
      source = "aws"
    }

    postgresql = {
      version = "~> 1.14.0"
      source = "cyrilgdn/postgresql"
    }

    helmfile = {
      version = "~> 0.14.1"
      source = "mumoshu/helmfile"
    }

    kubernetes = {
      version = "~> 2.7.1"
      source = "kubernetes"
    }
  }
}

# map parameters from variables.tf
data aws_ssm_parameter "params" {
  for_each = var.parameters
  name = each.key
  value = each.value
}
