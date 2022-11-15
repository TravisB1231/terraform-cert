resource "local_file" "pet" {
    filename = "./pets.txt"
    content = "We love pets!"
}

resource "local_file" "cat" {
    filename = "./cats.txt"
    content = "My favorite pet is Ser Pounce."
}
