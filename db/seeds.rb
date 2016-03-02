# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create!(
  title: "Wayne's World",
  director: "Penelope Spheeris",
  runtime_in_minutes: 94,
  description: "Two slacker friends try to promote their public-access cable show.",
  poster_image_url: File.open(File.join(Rails.root, 'waynes_world.jpg')),
  release_date: "14/02/1992"
)

User.create!(
  :firstname => "Bob", 
  :lastname => "Bobberson", 
  :password => "123456", 
  :password_confirmation => "123456", 
  :email => "admin@example.com",
  :admin => true
)