resource "aws_dynamodb_table" "ddk-dynamodb-table" {
  name         = var.table_names
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key
  range_key    = var.range_key

  attribute {
    name = var.range_key
    type = var.attribute_type
  }

  attribute {
    name = var.hash_key
    type = var.attribute_type
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  global_secondary_index {
    name            = var.gs_index_name
    hash_key        = var.hash_key
    range_key       = var.range_key
    projection_type = "KEYS_ONLY"
  }

  tags = {
    Name = var.tag_name
  }
}
