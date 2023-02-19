# Terraform Utility
A simple project which contains a collection of terraform utilities

# Terraform S3 Example
A simple project to pull a docker image of your choice just by passing the docker image name. 

Prerequisites
- Make sure you have `terraform` available in your workspace
- Make sure you have `docker` available in your workspace

# Variables
- Region : the default region is us-east-1, if you prefer to create resource in any other region of choice, please provide the region in `aws_region` variable

- BucketName: as the bucket name has to be unique, please provide a bucket name of your choice , `-var="bucket_name=<bucket_name_of_your_choice>"`.
Default value: `simple-bucket`
Note: to make the bucket name unique, uuid is generated and appended to the bucket name.

- TagName: tagging allows you to easily group resource based on a keyword. Please provide a tag name of your choice using the variable `tag_name`.
example `-var="tag_name=<Tag_name_of_your_choice>"`
default value : `Bucket Tag created by terraform`


- TagEnvironment: tagging allows you to easily group resource based on a keyword. Please provide a tag name of your choice using the variable `tag_environment`.
example `-var="tag_environment=<Tag_name_of_your_choice>"`
default value : `Bucket Environment Tag created by terraform`

## Create a S3 bucket with default configuration
`terraform init` to check the configurations

`terafform plan` to know more about the configuration

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

`terraform apply` to run the configuration 

- terraform will expect you to validate the changeset and confirm it by typing `Yes`. 

- On Yes, terraform will execute the configuration and will result in creation of s3 bucket in default region with name 'simple-bucket-(16-digit-uuid)


## DESTROY INFRASTRUCTURE
The terraform destroy command terminates resources managed by your Terraform project. This command is the inverse of terraform apply in that it terminates all the resources specified in your Terraform state. It does not destroy resources running elsewhere that are not managed by the current Terraform project

`terraform destroy`