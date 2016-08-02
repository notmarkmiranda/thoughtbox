require "rails_helper"

describe "user can update link through api" do
  before do
    Link.create(title: "Thought", link: "http://www.google.com")
    @link = Link.last
  end

  it "updates with correct attributes" do
    expect(@link.read).to eq false
    patch "/api/v1/links/#{@link.id}", {link: {read: true}}
    expect(Link.last.read).to eq true 
  end
end
