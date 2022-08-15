
resource "aws_security_group" "sg" {
  description = "Controls access to the ${local.name} redis cluster"

  name        = local.sg_name
  name_prefix = local.sg_name_prefix
  vpc_id      = local.vpc_id

  tags = local.tags
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = var.port
  to_port           = var.port
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = aws_security_group.sg.id
}
