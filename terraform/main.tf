# Provider configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# MySQL 5.7 test Instance
resource "aws_db_instance" "mysql_57" {
  identifier     = "mysql-57"
  engine         = "mysql"
  engine_version = "5.7.44"  # This triggers Infracost warning
  instance_class = "db.t3.small"
  
  allocated_storage     = 100
  storage_type         = "gp3"
  storage_encrypted    = true
  
  db_name  = "test"
  username = "admin"
  password = var.db_password
  
  skip_final_snapshot = true
  
  tags = {
    Name        = "mysql-57"
    Environment = "test"
  }
}
