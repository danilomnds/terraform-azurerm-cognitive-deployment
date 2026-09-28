resource "azurerm_cognitive_deployment" "this" {
  name                       = var.name
  cognitive_account_id       = var.cognitive_account_id
  dynamic_throttling_enabled = var.dynamic_throttling_enabled
  rai_policy_name            = var.rai_policy_name
  version_upgrade_option     = var.version_upgrade_option

  model {
    format  = var.model.format
    name    = var.model.name
    version = var.model.version
  }

  sku {
    name     = var.sku.name
    tier     = var.sku.tier
    size     = var.sku.size
    family   = var.sku.family
    capacity = var.sku.capacity
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]

    content {
      create = try(timeouts.value.create, null)
      read   = try(timeouts.value.read, null)
      update = try(timeouts.value.update, null)
      delete = try(timeouts.value.delete, null)
    }
  }
}