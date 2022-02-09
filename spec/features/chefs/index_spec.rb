require 'rails_helper'

# User Story 1, Parent Index (x2)
#
# For each Chef table
# As a visitor
# When I visit '/chefs'
# Then I see the name of each chef record in the system

RSpec.describe 'chef index' do
  it 'displays name of chef' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)
    chef_2 = Chef.create!(name: 'Gaston Acurio', age: 39, is_male: true, years_employed: 11)
    chef_3 = Chef.create!(name: 'Lena Rojas', age: 29, is_male: false, years_employed: 8)

    visit "/chefs/"

    expect(page).to have_content(chef_1.name)
    expect(page).to have_content(chef_2.name)
    expect(page).to have_content(chef_3.name)
  end

  # User Story 6, Parent Index sorted by Most Recently Created (x2)

# As a visitor
# When I visit the Chef index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  it 'it shows chef in order of created' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8, created_at: 10.seconds.ago)
    chef_2 = Chef.create!(name: 'Gaston Acurio', age: 39, is_male: true, years_employed: 11, created_at: 15.seconds.ago)
    chef_3 = Chef.create!(name: 'Lena Rojas', age: 29, is_male: false, years_employed: 8, created_at: 20.seconds.ago)

    visit "/chefs"

    expect(chef_1.name).to appear_before(chef_2.name)
    expect(chef_2.name).to appear_before(chef_3.name)
  end

#   User Story 9, Parent Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Chef Index

  it 'it displays the link at the top of the page' do
  gaston = Chef.create!(name: 'Gaston Acurio', age: 40, is_male: true, years_employed: 11)
  virgilio = Chef.create!(name: 'Virgilio Morales', age: 33, is_male: true, years_employed: 9)

  entree_1 = gaston.entrees.create!(name: 'Papa rellena', hot_dish: true, calories: 367)
  entree_2 = virgilio.entrees.create!(name: 'Ocopa', hot_dish: false, calories: 199)

  visit '/chefs'

  expect(page).to have_link('Chef Index')
  click_on('Chef Index')
  expect(page).to have_current_path('/chefs')
end

end
