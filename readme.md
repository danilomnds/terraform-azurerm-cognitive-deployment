# Module - Azure Cognitive Services Account Deployment
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/5.6.0)

Module developed to standardize the creation of Cognitive Services Account Deployments following CCoE guidelines. This module provisions only the `azurerm_cognitive_deployment` resource and does not create role assignments.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------|-----------------|
| v1.x.x         | v1.15.7           | 4.x             |
| v5.6.0         | v1.16.3           | 5.6.0           |

## Specifying a version

Pin the module source to a Git tag to prevent unintended module updates.

```hcl
module "cognitive_deployment" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-cognitive-deployment?ref=v5.6.0"

  name                 = "gpt-4o-mini"
  cognitive_account_id = "/subscriptions/<subscription-id>/resourceGroups/rg-example/providers/Microsoft.CognitiveServices/accounts/openai-example"

  model = {
    format  = "OpenAI"
    name    = "gpt-4o-mini"
    version = "2024-07-18"
  }

  sku = {
    name     = "Standard"
    capacity = 10
  }
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the Cognitive Services Account Deployment | `string` | n/a | Yes |
| cognitive_account_id | Resource ID of the Cognitive Services Account | `string` | n/a | Yes |
| model | Model configuration with `format`, `name`, and optional `version` | `object` | n/a | Yes |
| sku | SKU configuration with `name`, optional `tier`, `size`, `family`, and `capacity` | `object` | n/a | Yes |
| dynamic_throttling_enabled | Enables dynamic throttling for the deployment | `bool` | `null` | No |
| rai_policy_name | Name of the Responsible AI policy assigned to the deployment | `string` | `null` | No |
| version_upgrade_option | Deployment model version upgrade option | `string` | `"OnceNewDefaultVersionAvailable"` | No |
| timeouts | Optional timeouts for create/read/update/delete operations | `object` | `null` | No |

## Output variables

| Name | Description |
|------|-------------|
| name | Name of the created Cognitive Services Account Deployment |
| id | Resource ID of the created Cognitive Services Account Deployment |

## Documentation

Terraform Azure Cognitive Services Account Deployment:<br>
[https://registry.terraform.io/providers/hashicorp/azurerm/5.6.0/docs/resources/cognitive_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/5.6.0/docs/resources/cognitive_deployment)<br>

## Release Notes

### v5.6.0
- Initial version aligned with AzureRM provider `5.6.0`.
- Supports all documented `azurerm_cognitive_deployment` arguments, including `model`, `sku`, `dynamic_throttling_enabled`, `rai_policy_name`, `version_upgrade_option`, and `timeouts`.