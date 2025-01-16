# Create a new ECS instance for VPC
resource "alicloud_instance" "instance" {
  availability_zone = var.zone_id
  security_groups   = alicloud_security_group.group.*.id
  instance_charge_type       = var.instance_charge_type
  period                     = var.period
  period_unit                = var.period_unit
  instance_type              = var.instance_type
  image_id                   = "centos_7_9_x64_20G_alibase_20240403.vhd" # 按需替换为您自己的镜像，若使用此占位符，需要在服务创建成功后，编辑服务进行镜像关联
  system_disk_size           = 200
  system_disk_category       = "cloud_essd"
  password                   = var.password
  vswitch_id                 = var.vswitch_id
  internet_max_bandwidth_out = 5
}

locals {
    command  = file("${path.module}/scripts/startup.sh")
    base_64_command = base64encode(local.command)
  }

resource "alicloud_ecs_command" "command" {
  name            = "exec-cmd"
  command_content = local.base_64_command
  type            = "RunShellScript"
  timeout         = 3600
}

resource "alicloud_ecs_invocation" "default" {
    command_id  = alicloud_ecs_command.command.id
    instance_id = [alicloud_instance.instance.id]
    timeouts {
      create = "3600s"
    }
}

resource "alicloud_security_group" "group" {
  description = "security group"
  vpc_id      = var.vpc_id
}

resource "alicloud_security_group_rule" "allow_80_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "80/80"
  priority          = 1
  security_group_id = alicloud_security_group.group.id
  cidr_ip           = "0.0.0.0/0"
}
