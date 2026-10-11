output "mysql_channels_id" {
  description = "Map of id values across all mysql_channels, keyed the same as var.mysql_channels except keys with no id are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.id if v.id != null && length(v.id) > 0 }
}
output "mysql_channels_compartment_id" {
  description = "Map of compartment_id values across all mysql_channels, keyed the same as var.mysql_channels except keys with no compartment_id are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "mysql_channels_defined_tags" {
  description = "Map of defined_tags values across all mysql_channels, keyed the same as var.mysql_channels except keys with no defined_tags are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "mysql_channels_description" {
  description = "Map of description values across all mysql_channels, keyed the same as var.mysql_channels except keys with no description are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.description if v.description != null && length(v.description) > 0 }
}
output "mysql_channels_display_name" {
  description = "Map of display_name values across all mysql_channels, keyed the same as var.mysql_channels except keys with no display_name are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "mysql_channels_freeform_tags" {
  description = "Map of freeform_tags values across all mysql_channels, keyed the same as var.mysql_channels except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "mysql_channels_is_enabled" {
  description = "Map of is_enabled values across all mysql_channels, keyed the same as var.mysql_channels except keys with no is_enabled are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.is_enabled if v.is_enabled != null }
}
output "mysql_channels_lifecycle_details" {
  description = "Map of lifecycle_details values across all mysql_channels, keyed the same as var.mysql_channels except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "mysql_channels_source" {
  description = "Map of source values across all mysql_channels, keyed the same as var.mysql_channels except keys with no source are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => one(v.source) if v.source != null && length(v.source) > 0 }
  sensitive   = true
}
output "mysql_channels_state" {
  description = "Map of state values across all mysql_channels, keyed the same as var.mysql_channels except keys with no state are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.state if v.state != null && length(v.state) > 0 }
}
output "mysql_channels_system_tags" {
  description = "Map of system_tags values across all mysql_channels, keyed the same as var.mysql_channels except keys with no system_tags are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "mysql_channels_target" {
  description = "Map of target values across all mysql_channels, keyed the same as var.mysql_channels except keys with no target are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => one(v.target) if v.target != null && length(v.target) > 0 }
}
output "mysql_channels_time_created" {
  description = "Map of time_created values across all mysql_channels, keyed the same as var.mysql_channels except keys with no time_created are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "mysql_channels_time_updated" {
  description = "Map of time_updated values across all mysql_channels, keyed the same as var.mysql_channels except keys with no time_updated are omitted"
  value       = { for k, v in oci_mysql_channel.mysql_channels : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

