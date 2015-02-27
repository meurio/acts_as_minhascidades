require 'rails_helper'

RSpec.describe Organization, :type => :model do
  describe "#avatar_url" do
    it "should be the actual avatar url" do
      ENV['ACCOUNTS_BUCKET'] = "compartilhaco"
      organization = Organization.create avatar: "meurio.png"
      expect(organization.avatar_url).to be_eql("https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/organization/avatar/#{organization.id}/square_#{organization.avatar}")
    end
  end
end
