require 'rails_helper'

# User Story 1, Parent Index (x2)
#
# For each Chef table
# As a visitor
# When I visit '/chefs'
# Then I see the name of each chef record in the system

RSpec.describe 'chef index' do
  it ' displays name of chef' do
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

  it 'wip show chef in order of created' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8, created_at: 10.seconds.ago)
    chef_2 = Chef.create!(name: 'Gaston Acurio', age: 39, is_male: true, years_employed: 11, created_at: 15.seconds.ago)
    chef_3 = Chef.create!(name: 'Lena Rojas', age: 29, is_male: false, years_employed: 8, created_at: 20.seconds.ago)

    visit "/chefs"

    expect(chef_1.name).to appear_before(chef_2.name)
    expect(chef_2.name).to appear_before(chef_3.name)
  end
end
