variable "enabled" {
  description = "Flag to enable or disable the sending of emails"
  default     = "true"
}

variable "from" {
  description = "From address for email"
  type        = string
}

variable "to" {
  description = "Email recipients"
  type        = "list"
}

variable "subject" {
  description = "Email subject template"
  type        = string
}

variable "body" {
  description = "Email body template"
  type        = string
}

variable "host" {
  description = "SMTP Host"
  type        = string
}

variable "port" {
  description = "SMTP Port"
  type        = string
}

variable "vars" {
  description = "Parameters to pass to the body template"
  type        = map
}
