# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
require 'faker'

valid_abns = [
  '12004044937',
  '12004044969',
  '12004045391',
  '12004045440',
  '12004045472',
  '12004045521',
  '12004045553',
  '12004045585',
  '12004045602',
  '12004045634'
]

valid_airports = [
  { name: 'MEL', city: 'MEL' },
  { name: 'SYD', city: 'SYD' },
  { name: 'BNE', city: 'BNE' },
  { name: 'PER', city: 'PER' },
  { name: 'ADL', city: 'ADL' }
]

n_users = Faker::Number.between(50, 60)

n_users.times do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(
    first_name:           first_name,
    last_name:            last_name,
    email:                Faker::Internet.free_email(first_name + last_name),
    password:             Faker::Internet.password,
    phone:                Faker::PhoneNumber.phone_number
  )
  user.save

  airport = valid_airports.sample
  Post.create(
    abn:     valid_abns.sample,
    amount:  Faker::Number.decimal(2, 2),
    country: 'AU',
    city:    airport[:city],
    airport: airport[:name],
    date:    Faker::Time.between(Date.today, 14.days.from_now, :all),
    user:    user
  )
end