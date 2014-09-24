require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "#name" do
    it "should be the concatenation of first and last names" do
      user = User.new first_name: "Leonel", last_name: "Messi"
      expect(user.name).to be_eql("Leonel Messi")
    end
  end
end
