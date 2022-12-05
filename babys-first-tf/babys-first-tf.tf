resource "local_file" "pet" {
    filename = var.filename
    content = "My favorite pet of all time is ${random_pet.my-pet-2.id}"
}

resource "random_pet" "my-pet-2" {
  prefix = var.prefix[2]
  separator = var.separator
  length = var.length
}
