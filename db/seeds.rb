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
category1 = Category.create!({
	name: "Fashionsss"
	})
category2 = Category.create!({
	name: "kadsdkasj"
	})

business1 = Business.create!({
	user_id: user1.id,
	category_id: category1.id,
	name: "DD",
	logo: File.new("../../adfkjsdfh"),
	description:"kadff"

	})



likes1 = Like.create!({
	rating: 3,
	comment: "dskjfskdhf",
	user_id: user1.id,
	business_id: business1.id
	})

