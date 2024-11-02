//variable types

//map
variable file-content {
    type = map
    default = {
        "statement1" = "helloo"
        "statement2" = "hiiiii"
    }
}

//list
variable "prefix" {
  default = ["mr","mrs","sir"]
  type = list(string)
}

variable "prefix" {
  default = ["1","2","3"]
  type = list(number)  //within brackets we can't use number for strings even we have the same variable
}

//set
variable "prefi" {
  default = ["ab","bc","bc"]  //in a set type there shouldn't be a repeated data. this is wrong
  type = set(string)
}

//object type is a complex type
variable "bella" {
  type = object({
    name = string
    color = string
    age = number
    food = list(string)
    favorite_pet = bool
  })

  default = {
    name = "bella"
    color = "brown"
    age = 7
    food = [ "fish","chicken" ]
    favorite_pet = true
  }
}

//tuple is like list. but different
variable "kitty" {
  type = tuple([ string, number, bool ])
  default = [ "cat", 7, true ]
}

variable "kitty" {
  type = tuple([ string, number, bool ])
  default = [ "cat", 7, true, "dog" ]  //this is wrong. there is no typ for dog
}