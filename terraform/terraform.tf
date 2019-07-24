terraform {
    backend "s3" {
        encrypt = true
        bucket = "rob-todo-app"
        dynamodb_table = "rob-todo-app"
        region = "eu-west-1"
        key = "terraform.tfstate"
        }
}