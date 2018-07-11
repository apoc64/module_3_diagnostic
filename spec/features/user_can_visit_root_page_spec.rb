require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  it 'shows search results' do
    visit '/'

    fill_in 'q', with: '80203'
    click_on 'Locate'

    expect(current_path).to eq('/search')
    expect(page).to have_css(".results_table")
    expect(page).to have_content("Name")
    expect(page).to have_content("Address")
    expect(page).to have_content("Fuel Type")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Access Times")

    expect(page).to have_selector('.station_row', count: 10)
    # All results electric/propane
    # All distances less than 6
  end
end
