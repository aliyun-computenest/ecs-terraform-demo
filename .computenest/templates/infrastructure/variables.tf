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

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc."
  type        = string
  default     = "192.168.0.0/16"
}


variable "vswitch_cidrs" {
  description = "List cidr blocks used to create several new vswitches when 'new_vpc' is true."
  type        = string
  default     = "192.168.1.0/24"
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

