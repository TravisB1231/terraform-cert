resource "local_file" "pet" {
    filename = var.filename
    content = "My favorite pet of all time is ${random_pet.my-pet-2.id}"
}

resource "random_pet" "my-pet-2" {
  prefix = var.prefix[2]
  separator = var.separator
  length = var.length
}

resource "local_file" "whale" {
  filename = "./whale.txt"
  content = "Whale's need krill to survive."

  depends_on = [
    local_file.krill
  ]
}
resource "local_file" "krill" {
  filename = "./krill.txt"
  content = "Tasty whale food."
}