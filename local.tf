locals {
  short_location = substr(replace(var.location, " ", ""), 0, 3)
  name           = lower("${local.short_location}-${var.environment}-${var.tag_buildticket}")
  name_no_dash   = replace(local.name, "-", "")
}