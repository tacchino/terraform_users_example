resource "aws_iam_group" "ops" {
  name = "ops"
}

resource "aws_iam_user" "ops" {
  count = "${length(var.ops_users)}"
  name = "${element(var.ops_users, count.index)}"
}

resource "aws_iam_group_membership" "ops_users" {
  name = "ops-membership"

  group = "${aws_iam_group.ops.name}"
  users = ["${var.ops_users}"]
}

resource "aws_iam_group_policy_attachment" "ops-admin" {
  group = "${aws_iam_group.ops.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
