# terraform {
#   backend "azurerm" {
#     resource_group_name  = "NetworkWatcherRG"
#     storage_account_name = "backendstorage94"
#     container_name       = "tfstate"
#     key                  = "default.terraform.tfstate"
#   }
# }

# terraform {
#   backend "pg" {
#     conn_str = "postgres://demosql:India@123456789@mybackendsql.postgres.database.azure.com/postgres?sslmode=require"
#   }
# }

# terraform {
#   required_version = ">= 1.0.0"
#   backend "pg" {
#     host = "demosql.postgres.database.azure.com"
#     port = 5432
#     database = "postgres"
#     username = "demo"
#     password = "India@123456789"
#     schema = "public"
#     table = "terraform_state"
#   }
# }

# terraform {
#   backend "pg" {}
# }

terraform {
  backend "pg" {
    conn_str = "postgres://raj:India@123456789@raj.postgres.database.azure.com/postgres?sslmode=require"
  }
}

#terraform init -backend-config="conn_str=postgres://demo:India@123456789@demosql.postgres.database.azure.com/postgres?sslmode=disable"


# terraform {
#   backend "postgresql" {
#     conn_str = "postgres://demo:India@123456789@demosql.postgres.database.azure.com/postgres?sslmode=disable"
#     schema = "public"
#     table  = "terraform_state"
#   }
#   required_providers {
#     postgresql = {
#       version = "~> 2.0"
#       source = "hashicorp/postgresql"
#     }
#   }
# }

