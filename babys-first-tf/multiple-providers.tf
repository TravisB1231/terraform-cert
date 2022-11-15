resource "local_file" "pet2" {
    filename = "./pets2.txt"
    content = "We LOVE pets!"
}

resource "random_pet" "my-pet" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}
