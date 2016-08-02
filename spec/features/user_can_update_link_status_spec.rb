require "rails_helper"

RSpec.feature "Logged in use can change read/unread status", js: true do
  before do
    # user_create_and_login
    # user = User.last
    user = User.create(email: "a@b.com", password: "password")
    ApplicationController.any_instance.stub(:current_user).and_return(user)
    title = "mentorSHIP"
    link_url = "http://turing-mentorship.herokuapp.com"
    user.links.create(title: title, link: link_url)
  end

  it "starts with unread" do
    visit "/"
    expect(page).to have_css('div.read-false')
  end

end
