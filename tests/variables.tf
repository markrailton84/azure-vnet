# Base variables
variable "ddos_name" {
  type        = string
  description = "name of resources"
}

variable "name" {
  type        = string
  description = "name of resources"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "resource_group_name" {
    type = string
    description = "static rsg"
} 

# Tag variables

variable "tag_buildby" {
  type        = string
  description = "Name of the builder."
  default     = "Mark Railton"
}

variable "tag_buildticket" {
  type        = string
  description = "Ticket Number for the build"
  default     = "no ticket"
}

variable "tag_builddate" {
  type        = string
  description = "Date in ISO-8601 format (yyyymmdd)."
  default     = "20210119"
}

variable "environment" {
  type        = string
  description = "Prod,QA,STG,DEV,etc."
  default     = "DEV"
}

variable "publisher_email" {
  type        = string
  description = "Publisher email"
  default     = "mark.railton@rackspace.com"
}