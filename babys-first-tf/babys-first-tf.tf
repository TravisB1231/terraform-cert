resource "local_file" "pet" {
    filename = var.filename
    content = var.file-content["statement1"]
}

resource "random_pet" "my-pet-2" {
  prefix = var.prefix[2]
  separator = var.separator
  length = var.length
}
