require 'rails_helper'

# User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/entrees_name'
# Then I see each entree in the system including the Entree's attributes:

RSpec.describe 'entre index' do
  it 'displays each entree and its attributes' do
    entree_1 = Entree.create!(name: 'Papa rellena', hot_dish: true, calories: 367)
    entree_2 = Entree.create!(name: 'Tiradito', hot_dish: false, calories: 287)
    entree_3 = Entree.create!(name: 'Ocopa', hot_dish: false, calories: 199)

    visit '/entrees_name'
  end
end
