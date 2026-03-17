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
  region = "us-east-1"
}

# This will DEFINITELY trigger MySQL 5.7 policy
resource "aws_db_instance" "mysql_57_trigger" {
  identifier     = "mysql-57-trigger"
  engine         = "mysql"
  engine_version = "5.7"  # EXACT match - not 5.7.44
  instance_class = "db.t3.micro"
  
  allocated_storage     = 20
  storage_type         = "gp3"
  storage_encrypted    = true
  
  db_name  = "testdb"
  username = "admin"
  password = "TestPassword123!"  # Simple password for testing
  
  # CRITICAL: These tags ensure it's NOT filtered out
  tags = {
    Name        = "mysql-57-trigger"
    Environment = "development"  # Must be non-production
    ManagedBy   = "terraform"
  }
  
  skip_final_snapshot = true
}

# Backup instance with different naming
resource "aws_db_instance" "mysql_57_test" {
  identifier     = "mysql-57-test"
  engine         = "mysql"
  engine_version = "5.7"  # EXACT match
  instance_class = "db.t3.micro"
  
  allocated_storage     = 120
  storage_type         = "gp3"
  storage_encrypted    = true
  
  db_name  = "testdb2"
  username = "admin"
  password = "TestPassword123!"
  
  tags = {
    Name        = "mysql-57-test"
    Environment = "test"  # Non-production
  }
  
  skip_final_snapshot = true
}