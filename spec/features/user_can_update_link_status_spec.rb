require "rails_helper"

RSpec.feature "Logged in use can change read/unread status" do
  before do
    # user_create_and_login
    # user = User.last
    user = User.create(email: "a@b.com", password: "password")
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    title = "mentorSHIP"
    link = "http://turing-mentorship.herokuapp.com"
    user.links.create(title: title, link: link)
  end

  scenario "starts with unread", js: true do
    visit "/"
    # save_and_open_page
    # expect(page).to have_link "Mark as read"
  end
end
