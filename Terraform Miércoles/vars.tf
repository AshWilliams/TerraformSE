variable "rg-name" {
  description = "Azure RG"
  default = "rg_poc_servientrega"
}

variable "vn-name" {
  description = "Azure VN"
  default = "vn_poc_servientrega"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default = "eastus"
}