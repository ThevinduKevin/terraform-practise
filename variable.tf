variable file-content {
    type = map
    default = {
        "statement1" = "helloo"
        "statement2" = "hiiiii"
    }
}

variable "prefix" {
  default = ["mr","mrs","sir"]
  type = list(string)
}

variable "prefix" {
  default = ["1","2","3"]
  type = list(number)  //within brackets we can't use number for strings even we have the same variable
}