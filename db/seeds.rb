# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Entree.destroy_all

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

Band.destroy_all
Musician.destroy_all

beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)
beatles.musicians.create!(name:'Ringo Starr', instrument:'drums, vocals', founding_member:false, born:1940)

acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
acdc.musicians.create!(name:'Malcolm Young', instrument:'rhythm guitar', founding_member:true, born:1953)
acdc.musicians.create!(name:'Brian Johnson', instrument:'lead vocals', founding_member:false, born:1947)
acdc.musicians.create!(name:'Phil Rudd', instrument:'drums', founding_member:false, born:1954)

metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)
