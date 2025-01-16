variable "instance_charge_type" {
  type    = string
  default = "PostPaid"
  description = "付费类型"
}

variable "period" {
  type  = number
  default = 1
  description = "购买资源时长"
}

variable "period_unit" {
  type    = string
  default = "Month"
  description = "购买资源时长周期"
}

variable "zone_id" {
  type        = string
  description = "可用区"
}

variable "vpc_id" {
  type    = string
  default = null
  description = "专有网络VPC实例ID"
}

variable "vswitch_id" {
  type    = string
  default = null
  description = "交换机实例ID"
}

variable "instance_type"{
  type        = string
  description = "实例规格"
}

variable "password"{
  type        = string
  sensitive   = true
  description = "实例密码"

}

