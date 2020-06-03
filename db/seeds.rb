# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
State.create!

Question.create!(body: 'What is love ?', a: 'baby', b: 'dont', c: 'hurt', d: 'me', answer: 'd', rank: 2)
Question.create!(
  body: 'Tic Tac ?',
  a: 'boom',
  b: 'boom boom boom boom',
  c: 'i want you in my room',
  d: 'D',
  answer: 'c',
  rank: 1
)

Player.create!(name: 'Admin', is_admin: true)
Player.create!(name: 'Toto')
Player.create!(name: 'Tata')
