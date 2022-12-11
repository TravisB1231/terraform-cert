provider "aws" {}
resource "aws_iam_policy" "test-policy" {
  name = "tf-Admin-policy"
  # policy = file("admin-policy.json") - Specifies a file in the terraform directory
  policy = jsonencode(
  {
    "Version": "2012-10-17",
    "Statement":[
      {
        "Effect": "Allow",
        "Action": "*",
        "Resource": "*"
      }
    ]
  })
}
resource "aws_iam_user" "admin-users" {
  name =  var.project-users[count.index]
  count = length(var.project-users)
  tags = {
    Description = "Service user used for Terraform deployment."
  }
}
resource "aws_iam_user_policy_attachment" "test-attach" {
  user =  aws_iam_user.admin-users[count.index].name
  count = length(var.project-users)
  policy_arn = aws_iam_policy.test-policy.arn
}

# TODO - Create an admin group and do an admin policy attachment instead