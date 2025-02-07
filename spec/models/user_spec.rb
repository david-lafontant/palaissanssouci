require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "it is valid with valid attributes" do
      expect(build(:user)).to be_valid
    end
  end

  context "invalid Factory" do
    it "it is valid with valid attributes" do
      expect(build(:user, first_name: "")).to_not be_valid
    end
    it "it is valid with valid attributes" do
      expect(build(:user, last_name: "")).to_not be_valid
    end
    it "it is valid with valid attributes" do
      expect(build(:user, role: 6)).to_not be_valid
    end
  end
end
