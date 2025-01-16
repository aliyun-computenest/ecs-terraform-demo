output "server_address" {
  value  = format("http://%s:80", alicloud_instance.instance.public_ip)
}
