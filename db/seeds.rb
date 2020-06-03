# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create!(body: 'What is love ?', a: 'baby', b: 'dont', c: 'hurt', d: 'me', answer: 'd', rank: 0)

Player.create!(name: 'Admin', is_admin: true)
Player.create!(name: 'Toto')
Player.create!(name: 'Tata')
