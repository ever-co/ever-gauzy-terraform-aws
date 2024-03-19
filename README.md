# Ever Gauzy Terraform for AWS Cloud

## Overview

This Terraform module is designed to provision infrastructure components required for a Gauzy application environment in AWS. It includes modules for creating a Virtual Private Cloud (VPC), a Relational Database Service (RDS) instance, an Amazon Elastic Kubernetes Service (EKS) cluster, and deploying applications using Helm charts.

## Features

- Creates a Virtual Private Cloud (VPC) with public and private subnets
- Provisions an RDS instance (PostgreSQL or MySQL) for database needs
- Sets up an Amazon EKS cluster for hosting containerized applications
- Deploys applications using Helm charts, with support for external databases
- Allows for easy configuration of environment-specific variables

## Usage

### Prerequisites

- Terraform installed on your local machine
- AWS credentials configured with the necessary permissions


## Modules

### VPC

The VPC module creates a Virtual Private Cloud (VPC) with public and private subnets.

```hcl
module "vpc" {
  source      = "./modules/terraform-gauzy-vpc"
  environment = var.environment
  region      = var.region
}
```

### RDS

The RDS module provisions an RDS instance (PostgreSQL or MySQL) for database needs.

```hcl
module "rds" {
  source                = "./modules/terraform-gauzy-rds"
  environment           = var.environment
  region                = var.region
  database_subnet_group = module.vpc.database_subnet_group
  vpc_cidr              = module.vpc.vpc_cidr
  vpc_id                = module.vpc.vpc_id
}
```

### EKS

The EKS module sets up an Amazon Elastic Kubernetes Service (EKS) cluster for hosting containerized applications.

```hcl
module "eks" {
  source            = "./modules/terraform-gauzy-eks"
  environment       = var.environment
  cluster_version   = var.cluster_version
  region            = var.region
  private-subnet_id = module.vpc.private-subnet_id
  vpc_id            = module.vpc.vpc_id
}
```

### Helm

The Helm module deploys applications using Helm charts, with support for external databases.

```hcl
module "helm" {
  source                             = "./modules/terraform-gauzy-helm"
  environment                        = var.environment
  region                             = var.region
  name                               = var.name
  h_version                          = var.h_version
  chart                              = var.chart
  external_db                        = var.external_db
  api_host                           = var.api_host
  api_secretName                     = var.api_secretName
  web_host                           = var.web_host
  web_secretName                     = var.web_secretName
  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  cluster_name                       = module.eks.cluster_name
  db_instance_address                = module.rds.db_instance_address
  db_instance_username               = module.rds.db_instance_username
  db_instance_name                   = module.rds.db_instance_name
}
```

### Inputs

| Name                  | Description                                     | Type    | Default  |
|-----------------------|-------------------------------------------------|---------|----------|
| environment           | The environment to provision infrastructure for | string  | demo     |
| region                | The AWS region to deploy resources in           | string  | us-east-1|
| create_vpc            | Whether to create the VPC or not                | bool    | true     |
| create_rds            | Whether to create the RDS instance or not       | bool    | false    |
| create_eks            | Whether to create the EKS cluster or not        | bool    | false    |
| create_helm           | Whether to deploy applications using Helm       | bool    | false    |
| cluster_version       | Kubernetes version for the EKS cluster          | string  | 1.28     |
| name                  | Name of the Helm release                        | string  | ever-gauzy |
| h_version             | Version of the Helm chart to deploy             | string  | 0.1.9    |
| chart                 | Name of the Helm chart to deploy                | string  | ever-gauzy |
| external_db           | Whether to use an external database             | bool    | true     |
| api_host              | API host for the application                    | string  | apidemo.gauzy.co |
| api_secretName        | Secret name for API TLS certificate             | string  | chart-example-tls |
| web_host              | Web host for the application                    | string  | demo.gauzy.co |
| web_secretName        | Secret name for web TLS certificate             | string  | chart-example-tls |


[uri_gauzy]: https://gauzy.co
[uri_license]: https://www.gnu.org/licenses/agpl-3.0.html
[uri_license_image]: https://img.shields.io/badge/License-AGPL%20v3-blue.svg

![visitors](https://visitor-badge.laobi.icu/badge?page_id=ever-co.ever-gauzy-terraform-aws)
[![License: AGPL v3][uri_license_image]][uri_license]

## 🌟 What is it

Terraform to deploy [Ever Gauzy Platform](https://github.com/ever-co/ever-gauzy) into AWS Cloud.

## 🔗 Links

- **<https://github.com/ever-co/ever-gauzy-terraform>** - root repository for all our Terraform-related resources.
- **<https://gauzy.co>** - get more information about Ever Gauzy Platform.
- **<https://ever.co>** - get more information about our company products.

## 💌 Contact Us

- [Ever.co Website Contact Us page](https://ever.co/contacts)
- [Slack Community](https://join.slack.com/t/gauzy/shared_invite/enQtNzc5MTA5MDUwODg2LTI0MGEwYTlmNWFlNzQzMzBlOWExNTk0NzAyY2IwYWYwMzZjMTliYjMwNDI3NTJmYmM4MDQ4NDliMDNiNDY1NWU)
- [Discord Chat](https://discord.gg/hKQfn4j)
- [![Join the community on Spectrum](https://withspectrum.github.io/badge/badge.svg)](https://spectrum.chat/gauzy)
- [Gitter Chat](https://gitter.im/ever-co/ever)
- [![Get help on Codementor](https://cdn.codementor.io/badges/get_help_github.svg)](https://www.codementor.io/evereq?utm_source=github&utm_medium=button&utm_term=evereq&utm_campaign=github)
- [Telegram](https://t.me/everplatform)
- For business inquiries: <mailto:ever@ever.co>
- Please report security vulnerabilities to <mailto:security@ever.co>

## 🔐 Security

Ever® Gauzy Platform follows good security practices, but 100% security cannot be guaranteed in any software!
Ever® Gauzy Platform is provided AS IS without any warranty. Use at your own risk!
See more details in the [LICENSE](LICENSE.md).

In a production setup, all client-side to server-side (backend, APIs) communications should be encrypted using HTTPS/WSS/SSL (REST APIs, GraphQL endpoint, Socket.io WebSockets, etc.).

If you discover any issue regarding security, please disclose the information responsibly by sending an email to <mailto:security@ever.co> and not by creating a GitHub issue.

## 🛡️ License

We support the open-source community. If you're building awesome non-profit/open-source projects, we're happy to help and will provide (subject to [acceptance criteria](https://github.com/ever-co/ever-gauzy/wiki/Free-license-and-hosting-for-Non-profit-and-Open-Source-projects)) Enterprise edition license and free hosting option! Feel free to contact us at <mailto:ever@ever.co> to make a request. More details are explained in our [Wiki](https://github.com/ever-co/ever-gauzy/wiki/Free-license-and-hosting-for-Non-profit-and-Open-Source-projects).

### Ever Gauzy Platform License

- [Ever® Gauzy™ Platform Community Edition](https://github.com/ever-co/ever-gauzy/blob/master/LICENSE.md#gauzy-platform-community-edition-license)
- [Ever® Gauzy™ Platform Small Business](https://github.com/ever-co/ever-gauzy/blob/master/LICENSE.md#gauzy-platform-small-business-license)
- [Ever® Gauzy™ Platform Enterprise](https://github.com/ever-co/ever-gauzy/blob/master/LICENSE.md#gauzy-platform-enterprise-license)

#### The default Ever® Gauzy™ Platform license, without a valid Ever® Gauzy™ Platform Enterprise or Ever® Gauzy™ Platform Small Business License agreement, is the Ever® Gauzy™ Platform Community Edition License

#### Please see [LICENSE](LICENSE.md) for more information on licenses.

## ™️ Trademarks

**Ever**® is a registered trademark of [Ever Co. LTD](https://ever.co).
**Ever® Demand™**, **Ever® Gauzy™**,  **Ever® Teams™** and **Ever® OpenSaaS™** are all trademarks of [Ever Co. LTD](https://ever.co).

The trademarks may only be used with the written permission of Ever Co. LTD. and may not be used to promote or otherwise market competitive products or services.

All other brand and product names are trademarks, registered trademarks or service marks of their respective holders.

## 🍺 Contribute

- Please give us :star: on Github, it **helps**!
- You are more than welcome to submit feature requests in the [separate repo](https://github.com/ever-co/feature-requests/issues)
- Pull requests are always welcome! Please base pull requests against the _develop_ branch and follow the [contributing guide](.github/CONTRIBUTING.md).

## 💪 Thanks to our Contributors

<img src="https://contributors-img.web.app/image?repo=ever-co/ever-gauzy-terraform-aws" />

## ❤️ Powered By

<p>
  <a href="https://www.digitalocean.com/?utm_medium=opensource&utm_source=ever-co">
    <img src="https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/PoweredByDO/DO_Powered_by_Badge_blue.svg" width="201px">
  </a>
</p>

## ©️ Copyright

#### Copyright © 2024-present, Ever Co. LTD. All rights reserved

## 🔥 P.S

- [We are Hiring: remote TypeScript / NestJS / Angular developers](https://github.com/ever-co/jobs#available-positions)
