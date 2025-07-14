
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1" # 東京リージョン
}



# ECSクラスター
resource "aws_ecs_cluster" "main" {
  name = "main-cluster"
}
