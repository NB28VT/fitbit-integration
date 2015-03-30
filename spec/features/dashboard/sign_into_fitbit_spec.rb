require 'rails_helper'

feature "A user can get into their Fitbit account" do
  scenario "A user signs in with a valid fitbit code" do
    visit dashboard_index_path

    click_on "Link to fitbit validation"

    expect(page).to have_content("Enter code")
  end

  end
end
