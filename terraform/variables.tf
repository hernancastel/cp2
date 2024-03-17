variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "East US"
}

variable "resource_name" {
  type = string
  description = "Nombre del grupo de recursos"
  default = "K8S_RG" 
}

variable "environment" {
  type = string
  description = "Nombre del ambiente"
  default = "CP2" 
}

variable "storage_name" {
  type = string
  description = "Tipo de disco a crear"
  default = "storgeCP2"
}


############################ Configuracion Network ##################################

variable "net_address_prefixes" {
  type = string
  description = "rango ip subnet"
  default = "10.0.1.0/24" 
}

variable "net_address_space" {
  type = string
  description = "Rango ip net"
  default = "10.0.0.0/16" 
}

############################ Configuracion Security ##################################

variable "sec_group_name" {
  type = string
  description = "Rango ip net"
  default = "sshTraffic" 
}

############################ Configuracion  VM ##################################

variable "vm_name" {
  type = string
  description = "Nombre maquina virtual"
  default = "vm" 
}

variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2"
}

variable "vm_user_admin" {
  type = string
  description = "Nombre maquina virtual"
  default = "adminUsername" 
}

#################################### Configuracion de Imagen ########################

variable "vm_offer" {
  type = string
  description = "Tipo de offer"
  default = "centos-8-stream-free"
}

variable "vm_sku" {
  type = string
  description = "Tipo de sku"
  default = "centos-8-stream-free" 
}

variable "vm_publisher" {
  type = string
  description = "Tipo publisher"
  default = "cognosys" 
}

variable "vm_version" {
  type = string
  description = "Tipo de version"
  default = "22.03.28"
}