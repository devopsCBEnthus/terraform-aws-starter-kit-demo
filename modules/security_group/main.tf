resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  vpc_id      = var.vpc_id
  description = "Managed by Terraform"
  tags        = { Name = "${var.name}-sg" }
}

output "security_group_id" {
  value = aws_security_group.this.id
}
