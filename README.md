
# Terraform Example
 
This is an example for infrastructure as code (IaC) using modules in terraform with AWS as cloud provider.

In this example, we will create a few common services like EC2, RDS, S3 ... and related services to achieve the following architecture: 

![Terraform example](https://i.ibb.co/g4njJCg/terraform-example.png)


# How to use it?

You can build this infrastructure on your aws account by the following steps:

 - Clone this repo.
 - [install terraform](https://developer.hashicorp.com/terraform/downloads)
 - Create an [AWS access key](https://aws.amazon.com/premiumsupport/knowledge-center/create-access-key/)
 - Create terraform.tfvars file and add your AWS access key
 - In terminal, run `terraform init`
 - Run `terraform plan`
 - Run `terraform apply`

# Undo everything
just comment out the resources and modules and run terraform apply to destroy all created resources.
