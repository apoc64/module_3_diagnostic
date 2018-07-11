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
    expect(page).to have_content("Station")
    expect(page).to have_content("Distance")
    expect(page).to have_content("Fuel Type")
    expect(page).to have_content("Access Time")

    # expect css station_row 10 times
    # 10 results sorted by distance
    # All results electric/propane
    # All distances less than 6
  end
end
# ```As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times```
