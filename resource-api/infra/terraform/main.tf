provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

module "dynamodb_table" {
  source   = "../../../tf_modules/dynamodb"
  namespace = "development"
  api_name  = "ResourcesApi"
  table_name = "resources"
  hash_key = "_id"
  attributes = [
    {
      name = "_id"
      type = "S"
    }
  ]
}

module "prod_dynamodb_table" {
  source   = "../../../tf_modules/dynamodb"
  namespace = "prod"
  api_name  = "ResourcesApi"
  table_name = "resources"
  hash_key = "_id"
  attributes = [
    {
      name = "_id"
      type = "S"
    }
  ]
}

output "development_ddb_policy_arn" {
  description = "ARN of the DynamoDb Policy for ResourcesApi."
  value       = module.dynamodb_table.ddb_policy_arn
}

output "development_ddb_table_arn" {
  description = "ARN of the DynamoDb Table for ResourcesApi."
  value       = module.dynamodb_table.ddb_table_arn
}

output "prod_ddb_policy_arn" {
  description = "ARN of the DynamoDb Policy for ResourcesApi in Prod Env."
  value       = module.prod_dynamodb_table.ddb_policy_arn
}

output "prod_ddb_table_arn" {
  description = "ARN of the DynamoDb Table for ResourcesApi in Prod Env."
  value       = module.prod_dynamodb_table.ddb_table_arn
}