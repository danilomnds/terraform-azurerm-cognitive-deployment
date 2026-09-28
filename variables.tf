variable "name" {
  description = "Name of the Cognitive Services Account Deployment."
  type        = string
}

variable "cognitive_account_id" {
  description = "Resource ID of the Cognitive Services Account where the deployment will be created."
  type        = string
}

variable "model" {
  description = "Model configuration for the Cognitive Services Account Deployment."
  type = object({
    format  = string
    name    = string
    version = optional(string)
  })
}

variable "sku" {
  description = "SKU configuration for the Cognitive Services Account Deployment."
  type = object({
    name     = string
    tier     = optional(string)
    size     = optional(string)
    family   = optional(string)
    capacity = optional(number)
  })
}

variable "dynamic_throttling_enabled" {
  description = "Whether dynamic throttling is enabled for the Cognitive Services Account Deployment."
  type        = bool
  default     = null
}

variable "rai_policy_name" {
  description = "Name of the Responsible AI policy assigned to the deployment."
  type        = string
  default     = null
}

variable "version_upgrade_option" {
  description = "Deployment model version upgrade option. Possible values are OnceNewDefaultVersionAvailable, OnceCurrentVersionExpired, and NoAutoUpgrade."
  type        = string
  default     = "OnceNewDefaultVersionAvailable"
}

variable "timeouts" {
  description = "Optional timeouts for the Cognitive Services Account Deployment resource operations."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}