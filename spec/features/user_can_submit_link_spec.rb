require "rails_helper"

RSpec.feature "User can submit link" do
  before do
    user_create_and_login
  end

  scenario "happy path with valid data" do
    title = "the mentorSHIP"
    url = "http://turing-mentorship.herokuapp.com/"

    visit("/")
    fill_in "Title", with: title
    fill_in "Link", with: url
    click_button "GO!"

    expect(current_path).to eq "/links"
    expect(page).to have_content "Submitted \"#{title}\"!"
    within (".links") do
      expect(page).to have_link(title, href: url)
    end
  end

  scenario "sad path with no title" do
    title = "the mentorSHIP"
    url = "http://turing-mentorship.herokuapp.com/"

    visit("/")
    fill_in "Title", with: ""
    fill_in "Link", with: url
    click_button "GO!"

    expect(page).to have_content "The world is dying!"
    within (".links") do
      expect(page).to_not have_content(title)
    end
  end

  scenario "sad path with no link" do
    title = "the mentorSHIP"
    url = "http://turing-mentorship.herokuapp.com/"

    visit("/")
    fill_in "Title", with: title
    fill_in "Link", with: ""
    click_button "GO!"

    expect(page).to have_content "The world is dying!"
    within (".links") do
      expect(page).to_not have_content(title)
    end
  end
end
