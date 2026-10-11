variable "mysql_channels" {
  description = <<EOT
Map of mysql_channels, attributes below
Required:
    - source (block):
        - anonymous_transactions_handling (optional, block):
            - last_configured_log_filename (optional)
            - last_configured_log_offset (optional)
            - policy (required)
            - uuid (optional)
        - hostname (required)
        - must_use_ipv6on_dual_stack (optional)
        - password (required)
        - port (optional)
        - source_type (required)
        - ssl_ca_certificate (optional, block):
            - certificate_type (required)
            - contents (required)
        - ssl_mode (required)
        - username (required)
    - target (block):
        - applier_username (optional)
        - channel_name (optional)
        - db_system_id (required)
        - delay_in_seconds (optional)
        - filters (optional, block):
            - type (required)
            - value (required)
        - tables_without_primary_key_handling (optional)
        - target_type (required)
Optional:
    - compartment_id
    - defined_tags
    - description
    - display_name
    - freeform_tags
    - is_enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = optional(string)
    defined_tags   = optional(map(string))
    description    = optional(string)
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    is_enabled     = optional(bool)
    source = object({
      anonymous_transactions_handling = optional(object({
        last_configured_log_filename = optional(string)
        last_configured_log_offset   = optional(string)
        policy                       = string
        uuid                         = optional(string)
      }))
      hostname                   = string
      must_use_ipv6on_dual_stack = optional(bool)
      password                   = string
      port                       = optional(number)
      source_type                = string
      ssl_ca_certificate = optional(object({
        certificate_type = string
        contents         = string
      }))
      ssl_mode = string
      username = string
    })
    target = object({
      applier_username = optional(string)
      channel_name     = optional(string)
      db_system_id     = string
      delay_in_seconds = optional(number)
      filters = optional(list(object({
        type  = string
        value = string
      })))
      tables_without_primary_key_handling = optional(string)
      target_type                         = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.mysql_channels : (
        contains([for v in ["MYSQL"] : lower(v)], lower(v.source.source_type))
      )
    ])
    error_message = "must be one of: \"MYSQL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.mysql_channels : (
        v.source.anonymous_transactions_handling == null || (contains([for v in ["ASSIGN_MANUAL_UUID", "ASSIGN_TARGET_UUID", "ERROR_ON_ANONYMOUS"] : lower(v)], lower(v.source.anonymous_transactions_handling.policy)))
      )
    ])
    error_message = "must be one of: \"ASSIGN_MANUAL_UUID\", \"ASSIGN_TARGET_UUID\", \"ERROR_ON_ANONYMOUS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.mysql_channels : (
        v.source.ssl_ca_certificate == null || (contains([for v in ["PEM"] : lower(v)], lower(v.source.ssl_ca_certificate.certificate_type)))
      )
    ])
    error_message = "must be one of: \"PEM\""
  }
  validation {
    condition = alltrue([
      for k, v in var.mysql_channels : (
        contains([for v in ["DBSYSTEM"] : lower(v)], lower(v.target.target_type))
      )
    ])
    error_message = "must be one of: \"DBSYSTEM\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

