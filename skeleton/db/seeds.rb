# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.destroy_all
user1 = User.create!(username: "Darren", password: "starwar", session_token: 123)
user2 = User.create!(username: "Andy", password: "starwar", session_token: 321)
user3 = User.create!(username: "Oliver", password: "starwar", session_token: 456)
user4 = User.create!(username: "HarryPotter", password: "starwar", session_token: 654)
user5 = User.create!(username: "Mashu", password: "starwar", session_token: 789)


Cat.destroy_all

cat1 = Cat.create!(birth_date: '1993-01-06', color: "brown", name: "Ryan", sex: "M", description: "great cat!", user_id: user1.id)
cat2 = Cat.create!(birth_date: '1993-01-29', color: "black", name: "Andy", sex: "M", description: "awesome cat!", user_id: user1.id)
cat3 = Cat.create!(birth_date: '1993-05-02', color: "black", name: "Jennifer", sex: "F", description: "great cat!", user_id: user1.id)
cat4 = Cat.create!(birth_date: '1993-03-05', color: "white", name: "Mashu", sex: "M", description: "great cat!", user_id: user1.id)
cat5 = Cat.create!(birth_date: '1993-08-01', color: "orange", name: "Pete", sex: "M", description: "great cat!",user_id: user1.id)

CatRentalRequest.destroy_all
rental_request1 = CatRentalRequest.create!(cat_id: cat1.id, start_date: '2018-06-07', end_date: '2018-06-17', status: 'APPROVED')
rental_request2 = CatRentalRequest.create!(cat_id: cat2.id, start_date: '2018-07-07', end_date: '2018-07-17', status: 'DENIED')
rental_request3 = CatRentalRequest.create!(cat_id: cat3.id, start_date: '2018-08-07', end_date: '2018-08-17', status: 'PENDING')
