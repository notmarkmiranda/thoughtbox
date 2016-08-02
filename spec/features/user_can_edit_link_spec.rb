require "rails_helper"

RSpec.feature "User can edit link" do
  before do
    user_create_and_login
    user = User.last
    user.links.create(title: "test title", link: "http://www.google.com") 
  end

  it "happy path with valid title" do
    visit "/"
    click_link("edit")
    fill_in "Title", with: "new test title"
    click_button("Edit!")
    expect(page).to have_content("new test title")
  end

  it "happy path with valid link" do 
    visit "/"
    click_link("edit")
    fill_in "Link", with: "http://www.bing.com"
    click_button("Edit!")
    expect(page).to_not have_link("test title", href: "http://www.google.com")
    expect(page).to have_link("test title", href: "http://www.bing.com")
  end

  it "sad path with invalid title" do
    visit "/"
    click_link("edit")
    fill_in "Title", with: ""
    click_button("Edit!")
    expect(page).to have_content("not edited, you forgot something")
  end


  it "sad path with invalid link" do
    visit "/"
    click_link("edit")
    fill_in "Link", with: ""
    click_button("Edit!")
    expect(page).to have_content("not edited, you forgot something")
  end
end
