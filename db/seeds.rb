# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

Post.create([
  { name: 'Rizky', abn: "51824753556", amount: "123.4", date: DateTime.now },
  { name: 'Gara', abn: "51824753556", amount: "263.8", date: 2.days.ago },
  { name: 'Eko', abn: "51824753556", amount: "476.2", date: 7.days.ago }
  ])