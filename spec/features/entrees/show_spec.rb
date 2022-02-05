require 'rails_helper'

# User Story 4, Child Show (x2)

# As a visitor
# When I visit '/entrees/:id'
# Then I see the entrees with that id including the entree's attributes:

 RSpec.describe 'entree show page' do
   it 'it has attributes' do
     gaston = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

     entree = gaston.entrees.create!(name: 'Papa rellena', hot_dish: true, calories: 367)

     visit "/entrees/#{entree.id}"

     expect(page).to have_content(entree.name)
     expect(page).to have_content(entree.hot_dish)
     expect(page).to have_content(entree.calories)
   end
 end
