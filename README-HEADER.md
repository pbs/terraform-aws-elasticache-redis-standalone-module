# PBS TF ElastiCache Redis Standalone Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-elasticache-redis-standalone-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Provisions an Elasticache Redis cluster (with Cluster Mode Disabled).

> ℹ️ Note the confusing terminology around `Cluster Mode`. The `Cluster Mode` setting is a Redis feature that allows data to be sharded among nodes in a cluster, and requires some additional configuration to connect with it correctly. A Redis cluster that does not have `Cluster Mode` enabled is a set of standalone Redis nodes that have a single primary node for reading and writing and replica nodes for reading.

By default, it will provision one writer and one reader node, but that can be adjusted by setting the `nodes` variable to a different value.

This module also assumes that connections are established through a private DNS record created in Route53. This makes it so that replacement of the ElastiCache cluster can be made in a fashion that is transparent to application configurations. This can be adjusted by setting `create_dns` to `false`.

Integrate this module like so:

```hcl
module "redis" {
  source = "github.com/pbs/terraform-aws-elasticache-redis-standalone-module?ref=x.y.z"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
