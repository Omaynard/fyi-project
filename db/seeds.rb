# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!({
	email: "omar@hotmail.com",
	password: "password",
	encrypted_password: "password"
	})
catergory1 = Catergory.create!({
	name: "Fashion"
	

	})

business1 = Business.create!({
	user_id: user1.id,
	catergory_id: catergory1.id,
	name: "DD",
	logo: "fsef",
	description:"kadff"

	})

likes1 = Like.create!({
	rating: 3,
	comment: "dskjfskdhf",
	user_id: user1.id,
	business_id: business1.id
	})