variable "token" {
  description = "Token in yandex cloud"
  type        = string
  default     = "y0_AgAAAAACOdS_AATuwQAAAAD3G5kiilNjV3NuTmO4m2yWfwf6Zeskors"
}

variable "folder_id" {
  description = "Default folder ID in yandex cloud"
  type        = string
  default     = "b1gsvcsqd9jpi9m7nse8"
}

variable "cloud_id" {
  description = "Cloud ID in yandex cloud"
  type        = string
  default     = "b1grgevrrfola974isml"
}

variable "zone" {                                # Используем переменную для передачи в конфиг инфраструктуры
  description = "Use specific availability zone" # Опционально описание переменной
  type        = string                           # Опционально тип переменной
  default     = "ru-central1-a"                  # Опционально значение по умолчанию для переменной
}

variable "useros" {
  description = "User for OS"
  type        = string
  default     = "darklu"
}

variable "adm_pub_key" {
  description = "ssh key for conectc OS"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGvrS+vKCSlVlMpnRi9b8JNh0vEMi7KE5fOP8yrF82KR uncleloushouse@gmail.com"
}
