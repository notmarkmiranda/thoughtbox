require 'rails_helper'

RSpec.feature "User can sign out" do
  before do
    user_create_and_login
  end

  scenario "and is redirected to login page" do
    visit "/"

    expect(page).to have_link("Sign Out")

    click_link("Sign Out")
    expect(current_path).to eq "/login"
  end
end
