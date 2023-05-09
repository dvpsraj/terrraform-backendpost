terraform {
  backend "pg" {
    conn_str = "postgres://raj:India@123456789@raj.postgres.database.azure.com/postgres?sslmode=require"
  }
}
