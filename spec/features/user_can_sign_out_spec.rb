require 'rails_helper'

RSpec.feature "User can sign out" do
  before do
    user = User.create(email: "notmarkmiranda@gmail.com",
                       password: "password")
    visit "/login"
    fill_in "E-Mail", with: user.email
    fill_in "Password", with: "password"
    click_button "Log In!"
  end

  scenario "and is redirected to login page" do
    visit "/"

    expect(page).to have_link("Sign Out")

    click_link("Sign Out")
    expect(current_path).to eq "/login"
  end
end
