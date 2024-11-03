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

  