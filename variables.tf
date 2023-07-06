variable "aks_clusters" {
  default     = {}
  description = "Create a cluster from CAF module"
}
variable "resource_groups" {
  default = {}
}
variable "vnets" {
  default = {}
}
# variable "public_ip_addresses" {
#   default = {}
# }
# variable "keyvaults" {
#   default = {}
# }
variable "global_settings" {
  default = {}
}
variable "logged_user_objectId" {
  default = {}
}
