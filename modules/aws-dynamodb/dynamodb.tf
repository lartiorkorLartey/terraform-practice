resource "aws_dynamodb_table" "ddk-dynamodb-table" {
  name         = var.table_name
  billing_mode = var.billing_mode
  #   read_capacity  = 20
  #   write_capacity = 20
  hash_key  = var.hash_key
  range_key = var.range_key

  attribute {
    name = var.attribute_1_name
    type = var.attribute_1_type
  }

  attribute {
    name = var.attribute_2_name
    type = var.attribute_2_type
  }

  #   attribute {
  #     name = "TopScore"
  #     type = "N"
  #   }

  ttl {
    attribute_name = var.ttl_attribute_name
    enabled        = var.ttl_enabled
  }

  global_secondary_index {
    name      = var.gs_index_name
    hash_key  = var.gs_index_hash_key
    range_key = var.gs_index_range_key
    # write_capacity     = 20
    # read_capacity      = 20
    projection_type = var.gs_index_projection_type
    # non_key_attributes = ["pk"]
  }

  tags = {
    Name        = var.tag_name
    Environment = var.dynamodb_environment
  }
}