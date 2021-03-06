require_relative '../config/environment'

User.destroy_all
Author.destroy_all
Book.destroy_all
Category.destroy_all

seth = User.create(name: "Seth")
tess = User.create(name: "Tess")
tim = User.create(name: "Tim")
crocus = User.create(name: "Crocus")
bob = User.create(name: "Bob")

hf = Category.create(name: "Historical-Fiction")
fiction = Category.create(name: "Fiction")
nf = Category.create(name: "Non-Fiction")
fant = Category.create(name: "Fantasy")
scifi = Category.create(name: "Science-Fiction")

rb = Author.create(name: "Russell Banks")
hm = Author.create(name: "Herman Melville")
mg = Author.create(name: "Malcolm Gladwell")
grrm = Author.create(name: "George R.R. Martin")
pkd = Author.create(name: "Philip K. Dick")

cs = Book.create(title: "Cloudsplitter", category_id: hf.id, author_id: rb.id)
aff = Book.create(title: "Affliction", category_id: hf.id, author_id: rb.id)
tsha = Book.create(title: "The Sweet Hereafter", category_id: fiction.id, author_id: rb.id)
md = Book.create(title: "Moby Dick", category_id: fiction.id, author_id: hm.id)
freak = Book.create(title: "Freakonomics", category_id: nf.id, author_id: mg.id)
got = Book.create(title: "A Game of Thrones", category_id: fant.id, author_id: grrm.id)
sos = Book.create(title: "A Storm of Swords", category_id: fant.id, author_id: grrm.id)
doad = Book.create(title: "Do Androids Dream of Electric Sheep?", category_id: scifi.id, author_id: pkd.id)
asd = Book.create(title: "A Scanner Darkly", category_id: scifi.id, author_id: pkd.id)

puts "Seeded!"