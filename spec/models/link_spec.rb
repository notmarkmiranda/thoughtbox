require "rails_helper"

RSpec.describe Link, "validations" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link) }
  it { should belong_to(:user) }
end
