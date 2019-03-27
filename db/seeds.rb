# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

user1 = User.new(
  username: "clairemuller",
  password: "1234",
  email: "cmuller@hotmail.com",
  location: "Seattle",
  pet_name: "George",
  pet_age: 2,
  pet_bio: "George is a cute kitty with a big personality!"
)
user1.pet_pic.attach(io: File.open("app/assets/images/cat1.jpg"), filename: "cat1.jpg")
user1.save

user2 = User.new(
  username: "johnwhite",
  password: "1234",
  email: "jwhite@hotmail.com",
  location: "Portland",
  pet_name: "Henry",
  pet_age: 2,
  pet_bio: "Henry is a cute doggy with a big personality!"
)
user2.pet_pic.attach(io: File.open("app/assets/images/dog1.jpg"), filename: "dog1.jpg")
user2.save

user3 = User.new(
  username: "timsmith",
  password: "1234",
  email: "tsmith@hotmail.com",
  location: "Seattle",
  pet_name: "Wilson",
  pet_age: 2,
  pet_bio: "Wilson is a cute doggy with a big personality!"
)
user3.pet_pic.attach(io: File.open("app/assets/images/dog2.jpeg"), filename: "dog2.jpeg")
user3.save

user4 = User.new(
  username: "jimmiller",
  password: "1234",
  email: "jmiller@hotmail.com",
  location: "Chicago",
  pet_name: "Spike",
  pet_age: 2,
  pet_bio: "Spike is a cute doggy with a big personality!"
)
user4.pet_pic.attach(io: File.open("app/assets/images/dog3.jpg"), filename: "dog3.jpg")
user4.save

user5 = User.new(
  username: "nickwright",
  password: "1234",
  email: "nwright@hotmail.com",
  location: "Los Angeles",
  pet_name: "Max",
  pet_age: 2,
  pet_bio: "Max is a cute doggy with a big personality!"
)
user5.pet_pic.attach(io: File.open("app/assets/images/dog4.jpg"), filename: "dog4.jpg")
user5.save

user6 = User.new(
  username: "christinamartin",
  password: "1234",
  email: "cmartin@hotmail.com",
  location: "New York",
  pet_name: "Spot",
  pet_age: 2,
  pet_bio: "Spot is a cute doggy with a big personality!"
)
user6.pet_pic.attach(io: File.open("app/assets/images/dog5.jpg"), filename: "dog5.jpg")
user6.save

user7 = User.new(
  username: "bakeradams",
  password: "1234",
  email: "badams@hotmail.com",
  location: "Seattle",
  pet_name: "Buddy",
  pet_age: 2,
  pet_bio: "Buddy is a cute doggy with a big personality!"
)
user7.pet_pic.attach(io: File.open("app/assets/images/dog6.png"), filename: "dog6.png")
user7.save

user8 = User.new(
  username: "josegonzales",
  password: "1234",
  email: "jgonzales@hotmail.com",
  location: "Seattle",
  pet_name: "Archie",
  pet_age: 2,
  pet_bio: "Archie is a cute doggy with a big personality!"
)
user8.pet_pic.attach(io: File.open("app/assets/images/dog7.png"), filename: "dog7.png")
user8.save

user9 = User.new(
  username: "kathyhall",
  password: "1234",
  email: "khall@hotmail.com",
  location: "Seattle",
  pet_name: "Toby",
  pet_age: 2,
  pet_bio: "Toby is a cute doggy with a big personality!"
)
user9.pet_pic.attach(io: File.open("app/assets/images/dog8.jpg"), filename: "dog8.jpg")
user9.save

