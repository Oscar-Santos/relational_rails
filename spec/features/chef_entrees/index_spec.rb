require 'rails_helper'

# User Story 5, Chef Entrees Index (x2)
#
# As a visitor
# When I visit '/chefs/:chef_id/entrees'
# Then I see each entree that is associated with that Chef with each Entree's attributes:

RSpec.describe 'chef entree index' do
  it 'it displays each entree associated with that Chef' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

    entree_1 = chef_1.entrees.create!(name: 'Ceviche', hot_dish: false, calories: 387)
    entree_2 = chef_1.entrees.create!(name: 'Anticuchos', hot_dish: true, calories: 199)
    entree_3 = chef_1.entrees.create!(name: 'Causa', hot_dish: true, calories: 81)

    visit "/chefs/#{chef_1.id}/entrees"

    expect(page).to have_content(entree_1.name)
  end
end
