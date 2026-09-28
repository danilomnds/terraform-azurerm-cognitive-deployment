output "name" {
  description = "Name of the created Cognitive Services Account Deployment."
  value       = azurerm_cognitive_deployment.this.name
}

output "id" {
  description = "Resource ID of the created Cognitive Services Account Deployment."
  value       = azurerm_cognitive_deployment.this.id
}