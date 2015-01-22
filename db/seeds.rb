# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{email:"clayton.fussell@gmail.com"},{email: "bob@bob.com"}])

Product.create(
				[
					{
						name: 				"Earth",
						price_in_pence: 	"5000",
						description: 		"Watery planet populated by various species. Rich in minerals. Annoying species."
					},
					{
						name: 				"Mars",
						price_in_pence: 	"2000",
						description: 		"Loads of rock. Bargain. Nothing to stop you."
					}

			 	]
			 )