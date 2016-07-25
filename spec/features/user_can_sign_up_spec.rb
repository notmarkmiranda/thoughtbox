require 'rails_helper'

RSpec.feature "User can sign up for an account" do
  scenario "from the root path" do
    visit "/"
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"

    click_link "Sign Up!"

    expect(current_path).to eq "/users/new"
    fill_in "E-Mail", with: "notmarkmiranda@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Lets Go!"

    expect(current_path).to eq "/links"
    expect(page).to have_content "Yay!"
  end

end

RSpec.feature "User cannot sign up with an already used email" do
  before do
    User.create(email: "notmarkmiranda@gmail.com",
                password: "password")
  end
  scenario "uses the same e-mail" do
    visit "/users/new"
    fill_in "E-Mail", with: "notmarkmiranda@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_button "Lets Go!"

    expect(page).to have_content "Something went wrong! =("
  end

  scenario "passwords do not match" do
    visit "/users/new"
    fill_in "E-Mail", with: "markmiranda51@gmail.com"
    fill_in "Password", with: "password1"
    fill_in "Password Confirmation", with: "password"
    click_button "Lets Go!"

    expect(page).to have_content "Something went wrong! =("

  end
end
