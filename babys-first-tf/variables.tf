# Variable definition priority:
# 1 (Top) - -var or -var-file CLI flags
# 2 - *.auto.tfvars (alphabetical order)
# 3 - terraform.tfvars
# 4 (Lowest) - Environment Variables
variable "filename" {
}
variable "content" {
  default = "My favorite pet of all time is Ser Pounce!"
}
variable "prefix" {
  default = ["Mr", "Mrs", "Ser"]
  type = list(string)
}
variable "separator" {
  default = " "
}
variable "length" {
  default = "1"
}
variable "file-content" {
  type = map
  default = {
    "statement1" = "We love pets!"
    "statement2" = "We love animals!"
  }
}
variable "cat" {
  type = object({
    name = string
    color = string
    age = number
    food = list(string)
    favorite_pet = bool
  })
  default = {
    age = 7
    color = "grey"
    favorite_pet = true
    food = [ "cat nip", "lizards" ]
    name = "Fanny"
  }
}
variable "kitty" {
  type = tuple([string, number, bool])
  default = ["cat", 7, true]
}
