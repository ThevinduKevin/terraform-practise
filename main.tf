resource local_file my-pet {
  filename = ""
  content = var.file-content[statement1]
}

////////
resource "local_file" "name" {
  filename = var.filename
  content = var.content
} //by using empty variable inputs we can input data manually
//there are many ways of input data
//interactive mode, command line flags, environment variables(export TF_VAR_variablename), variable definition files(use .tfvars extension)
//order of getting input vars -> 1-environment var, 2- .tfvars, 3-.auto.tfvars, 4-command line flags


resource "local_file" "pet" {
  filename = var.filename
  content = "my fav pet is ${random_pet.my-pet.id}" //this take the random id that generated as an input variable. this type called as interpolation sequence  
}
resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}//this generate a random id

//explicit dependency
resource "local_file" "pet" {
  filename = var.filename
  content = "my pet"
  depends_on = [ 
    random_pet.my-pet  //we define dendency in here
   ]
}
resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}

//output.tf structure
output "<variable_name>" //like random_Pet.my-pet.id
 {
  value = "<variable_value>"
  <argument>
}

//state???
//there are 2 types of dependencies. implicit and explicit
//to track meta data in terminal -> cat terraform.tfstate
//2 kinds of configuration directory -> state files and configuration files


//terraform commands
//terraform validate -> validaate file
//terraform fmt -> ??
//terraform show -> show current state
//terrfarom show -json -> show in a json format
//terraform providers -> show all providers 
//terraform providers mirror -> to mirror the providers
//terraform output -> to see output
//terraform refresh -> to refresh data
//terraform graph -> show graph of dependencies
//mutable infrastructure -> 
//immutable infrastucture -> old server remove and get a new updated server
// in terraform when do changes it delete old version and create a new one


///rules 
//1)create before destroy rule -> 
resource "local_file" "name"{
  some arguments

  lifecycle{
    create_before_destroy = true
  } 
}

//2)prevent destroy
resource "local_file" "name"{
  some arguments

  lifecycle{
    prevent_destroy = true
  } 
}

//3)ignore_changes
resource "aws_instance" "webserver" {
  ami = ""
  instance_type = "t2.macro"
  tags = {
    Name = "ProjectA-webserver"
  }
  lifecycle{
    ignore_changes = [ //ignore_changes = all
      tags,ami   //the attributed we put here never get changed 
    ]
  }
}

//data sources - to read files that are in same directory but not connect to the terraform
data "local_file" "dog"{
  filename = "/root/dog.txt"
}

//meta arguments
//when creating multiple instances of same resource
//an example is depends on and lifecycle of terraform. we used above codes


//loops in terraform
//for_each
//this work only with a map or a set type
 variable "filename" {
  type = set(string)
  default = [
    "file1"
    "file2"
    "file3"
  ]
 }

 resource "local_file" "pet"{
  filename = each.value
  for_each = var.filename  // we can change the type by toset(var.filename)
 }

 //version constrains
 terraform {
  required_providers{
    local = {
      source = "hashicorp/local"
      version = "1.4.0" // "<1.4.0 means version lower than 1.4.0"
    } // "~> 1.2.0" means version 1.2.0 or the highest increment of it. like 1.2.9
  }
 }

 







