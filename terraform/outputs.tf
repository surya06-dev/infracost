output "rds_instance_endpoints" {
  description = "RDS instance endpoints"
  value = {
    prod    = aws_db_instance.mysql_57_prod.endpoint
    dev     = aws_db_instance.mysql_57_dev.endpoint
    staging = aws_db_instance.mysql_57_staging.endpoint
  }
}

output "rds_instance_ids" {
  description = "RDS instance identifiers"
  value = {
    prod    = aws_db_instance.mysql_57_prod.id
    dev     = aws_db_instance.mysql_57_dev.id
    staging = aws_db_instance.mysql_57_staging.id
  }
}