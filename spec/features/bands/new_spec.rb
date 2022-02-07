# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

require 'rails_helper'

RSpec.describe 'the bands new feature' do

  it 'User Story 11, Parent Creation' do
    visit '/bands'

    expect(page).to_not have_content('AC/DC')
    expect(page).to have_link("New Band")

    # save_and_open_page
    click_link "New Band"

    expect(current_path).to eq('/bands/new')

    # save_and_open_page
    fill_in('Name', with: 'AC/DC')
    fill_in('Year Founded', with: '1973')
    fill_in('Genre', with: 'hard rock')
    fill_in('Currently Active', with: 'false')

    click_button('Create Band')

    expect(current_path).to eq("/bands")
    expect(page).to have_content('AC/DC')

    # save_and_open_page
  end


end
