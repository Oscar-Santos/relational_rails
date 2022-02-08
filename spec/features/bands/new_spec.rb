require 'rails_helper'

RSpec.describe 'the bands#new feature' do

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
