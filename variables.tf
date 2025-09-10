variable "region_default" {
  description = "Região padrão da AWS"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "fiap-terraform-kubernetes"
}

variable "cidr_vpc" {
  description = "O bloco IPs para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zone" {
  description = "Zona de disponibilidade para o subnet"
  type        = string
  default     = "us-east-1a"

}