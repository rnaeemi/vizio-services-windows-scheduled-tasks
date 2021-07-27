terraform {
  backend "s3" {
    bucket = "vizio-terraform-state"
    key    = "windows_scheduled_tasks"
    region = "us-west-2"

    dynamodb_table = "vizio-terraform-state-locks"
  }
}
