# Azure Role Assignment Module

## Resources

- Azure Role Assignment

## Example

```hcl
module "acr_pull_role" {

  source = "../../modules/role-assignment"

  scope = module.acr.acr_id

  role_definition_name = "AcrPull"

  principal_id = module.managed_identity.principal_id

}
```