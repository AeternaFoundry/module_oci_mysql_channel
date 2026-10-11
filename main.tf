resource "oci_mysql_channel" "mysql_channels" {
  for_each = var.mysql_channels

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  is_enabled     = each.value.is_enabled

  source {
    dynamic "anonymous_transactions_handling" {
      for_each = each.value.source.anonymous_transactions_handling != null ? [each.value.source.anonymous_transactions_handling] : []
      content {
        last_configured_log_filename = anonymous_transactions_handling.value.last_configured_log_filename
        last_configured_log_offset   = anonymous_transactions_handling.value.last_configured_log_offset
        policy                       = anonymous_transactions_handling.value.policy
        uuid                         = anonymous_transactions_handling.value.uuid
      }
    }
    hostname                   = each.value.source.hostname
    must_use_ipv6on_dual_stack = each.value.source.must_use_ipv6on_dual_stack
    password                   = each.value.source.password
    port                       = each.value.source.port
    source_type                = each.value.source.source_type
    dynamic "ssl_ca_certificate" {
      for_each = each.value.source.ssl_ca_certificate != null ? [each.value.source.ssl_ca_certificate] : []
      content {
        certificate_type = ssl_ca_certificate.value.certificate_type
        contents         = ssl_ca_certificate.value.contents
      }
    }
    ssl_mode = each.value.source.ssl_mode
    username = each.value.source.username
  }

  target {
    applier_username = each.value.target.applier_username
    channel_name     = each.value.target.channel_name
    db_system_id     = each.value.target.db_system_id
    delay_in_seconds = each.value.target.delay_in_seconds
    dynamic "filters" {
      for_each = each.value.target.filters != null ? each.value.target.filters : []
      content {
        type  = filters.value.type
        value = filters.value.value
      }
    }
    tables_without_primary_key_handling = each.value.target.tables_without_primary_key_handling
    target_type                         = each.value.target.target_type
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

