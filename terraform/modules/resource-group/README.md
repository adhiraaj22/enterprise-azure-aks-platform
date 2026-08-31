# Azure Resource Group Module

## Description

This module creates one or more Azure Resource Groups using the `for_each` meta-argument.

---

## Resources

- Azure Resource Group

---

## Inputs

| Name | Type |
|------|------|
| rgs | map(object) |
| tags | map(string) |

---

## Outputs

- resource_group_names
- resource_group_ids
- resource_group_locations

---

## Example

```hcl
module "resource_group" {

  source = "../../modules/resource-group"

  rgs = var.rgs

  tags = local.common_tags

}
```
