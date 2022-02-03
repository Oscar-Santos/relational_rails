# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Entree.destroy_all
# Band.destroy_all
# Musician.destroy_all

gaston = Chef.create!(name: 'Gaston Acurio', age: 40, is_male: true, years_employed: 11)
virgilio = Chef.create!(name: 'Virgilio Morales', age: 33, is_male: true, years_employed: 9)
dominique = Chef.create!(name: 'Dominique Crenn', age: 27, is_male: false, years_employed: 15)
luisa = Chef.create!(name: 'Luisa Marelli', age: 47, is_male: false, years_employed: 19)

gaston.entrees.create!(name: 'Lomo Saltado', hot_dish: true, calories: 3000)
gaston.entrees.create!(name: 'Causa Rellena', hot_dish: false, calories: 280)

virgilio.entrees.create!(name: 'Ceviche', hot_dish: false, calories: 1700)

dominique.entrees.create!(name: 'Onion Soup', hot_dish: false, calories: 410)

luisa.entrees.create!(name: 'Polenta', hot_dish: true, calories: 350)
luisa.entrees.create!(name: 'Lasagna', hot_dish: true, calories: 700)
