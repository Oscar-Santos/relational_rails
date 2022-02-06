require 'rails_helper'

# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/chef/:id'
# Then I see the chef with that id including the chef's attributes:
# - data from each column that is on the chef table
RSpec.describe 'chef show page' do
  it 'it has attributes' do
    chef = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_content(chef.age)
    expect(page).to have_content(chef.is_male)
    expect(page).to have_content(chef.years_employed)
  end

#   User Story 7, Parent Child Count (x2)
#
# As a visitor
# When I visit a chef's show page
# I see a count of the number of entrees associated with this chef

  it 'it can displays the count of number of entrees' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

    entree_1 = chef_1.entrees.create!(name: 'Ceviche', hot_dish: false, calories: 387)
    entree_2 = chef_1.entrees.create!(name: 'Anticuchos', hot_dish: true, calories: 199)
    entree_3 = chef_1.entrees.create!(name: 'Causa', hot_dish: true, calories: 81)

    visit "/chefs/#{chef_1.id}"
    number_of_entrees = chef_1.entrees.count

    expect(page).to have_content("number of entrees #{number_of_entrees}")
  end
end
