resource "aws_dynamodb_table" "my-dynamodb-table1" {
  name           = "my-dynamodb-1"
  billing_mode   = "PAY_PER_REQUEST" #if Billong mode is "PROVISIONED" that means it is always active #it it is "PAY-PER-REQUEST" then it will only when there is request.
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name        = "my-dynamodb-1"
  }
}