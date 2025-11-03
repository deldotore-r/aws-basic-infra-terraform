variable "aws_region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Perfil AWS CLI"
  type        = string
  default     = "default"
}

variable "project" {
  description = "Nome do projeto"
  type        = string
  default     = "my-project"
}

variable "environment" {
  description = "Ambiente (dev/stg/prod)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.micro"
}

variable "owner" {
  description = "Dono do projeto / usuário"
  type        = string
  default     = "YOUR_NAME"
}

variable "ssh_cidr" {
  description = "CIDR para acesso SSH"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_cidr" {
  description = "CIDR para acesso HTTP"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ami" {
  description = "AMI da instância EC2"
  type        = string
  default     = "ami-xxxxxxxxxxxxxxxxx" # Substitua pelo ID desejado
}
