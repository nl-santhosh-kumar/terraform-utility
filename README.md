# Terraform Utility
A simple project which contains a collection of terraform utilities

# Terraform Docker Example
A simple project to pull a docker image of your choice just by passing the docker image name. 

Prerequisites
- Make sure you have `terraform` available in your workspace
- Make sure you have `docker` available in your workspace

## PULL A NGINX DOCKER IMAGE
`terraform init` to check the configurations

`terraform apply` to run the configuration 

- terraform will expect you to validate the changeset and confirm it by typing `Yes`. 

- On Yes, terraform will execute the configuration and pull a default image which is `nginx:latest`

## PULL A NODE LATEST DOCKER IMAGE
`terraform init` to check the configurations

`terraform apply -var="image_name=NODE"` to run the configuration 

- terraform will expect you to validate the changeset and confirm it by typing `Yes`. 

- On Yes, terraform will execute the configuration and pull a default image which is `node:latest`

Note: the default value for version of an image is latest

## PULL A SPECIFIC VERSION OF A DOCKER IMAGE
`terraform init` to check the configurations

`terraform apply -var="image_name=NODE" -var="image_version=16-alpine"` to run the configuration 

- terraform will expect you to validate the changeset and confirm it by typing `Yes`. 

- On Yes, terraform will execute the configuration and try to pull the image matching the name and version. 

Note: the script do not validate if the image name and version are valid. Incase of image not found, then terraform will give you an error.

## ON SUCCESSFUL EXECUTION OF TERRAFORM COMMAND
The terraform execution will result in logging of image information `image_information = "nginx:latest"` 


## DESTROY INFRASTRUCTURE
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state. It does not destroy resources running elsewhere that are not managed by the current Terraform project

`terraform destroy`