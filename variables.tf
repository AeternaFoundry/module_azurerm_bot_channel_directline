variable "bot_channel_directlines" {
  description = <<EOT
Map of bot_channel_directlines, attributes below
Required:
    - bot_name
    - location
    - resource_group_name
    - site (block):
        - enabled (optional)
        - endpoint_parameters_enabled (optional)
        - enhanced_authentication_enabled (optional)
        - name (required)
        - storage_enabled (optional)
        - trusted_origins (optional)
        - user_upload_enabled (optional)
        - v1_allowed (optional)
        - v3_allowed (optional)
EOT

  type = map(object({
    bot_name            = string
    location            = string
    resource_group_name = string
    site = list(object({
      enabled                         = optional(bool)
      endpoint_parameters_enabled     = optional(bool)
      enhanced_authentication_enabled = optional(bool)
      name                            = string
      storage_enabled                 = optional(bool)
      trusted_origins                 = optional(set(string))
      user_upload_enabled             = optional(bool)
      v1_allowed                      = optional(bool)
      v3_allowed                      = optional(bool)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        length(v.site) >= 1
      )
    ])
    error_message = "Each site list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        length(v.bot_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        alltrue([for item in v.site : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.bot_channel_directlines : (
        alltrue([for item in v.site : (item.trusted_origins == null || (alltrue([for x in item.trusted_origins : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

