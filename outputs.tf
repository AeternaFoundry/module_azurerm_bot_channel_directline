output "bot_channel_directlines_id" {
  description = "Map of id values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bot_channel_directlines_bot_name" {
  description = "Map of bot_name values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.bot_name if v.bot_name != null && length(v.bot_name) > 0 }
}
output "bot_channel_directlines_extension_key_1" {
  description = "Map of extension_key_1 values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.extension_key_1 if v.extension_key_1 != null && length(v.extension_key_1) > 0 }
  sensitive   = true
}
output "bot_channel_directlines_extension_key_2" {
  description = "Map of extension_key_2 values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.extension_key_2 if v.extension_key_2 != null && length(v.extension_key_2) > 0 }
  sensitive   = true
}
output "bot_channel_directlines_location" {
  description = "Map of location values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.location if v.location != null && length(v.location) > 0 }
}
output "bot_channel_directlines_resource_group_name" {
  description = "Map of resource_group_name values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "bot_channel_directlines_site" {
  description = "Map of site values across all bot_channel_directlines, keyed the same as var.bot_channel_directlines"
  value       = { for k, v in azurerm_bot_channel_directline.bot_channel_directlines : k => v.site if v.site != null && length(v.site) > 0 }
  sensitive   = true
}

