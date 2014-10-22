require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "#name" do
    it "should be the concatenation of first and last names" do
      user = User.new first_name: "Leonel", last_name: "Messi"
      expect(user.name).to be_eql("Leonel Messi")
    end
  end

  describe "#avatar_url" do
    context "when the user have an avatar" do
      it "should be the actual avatar url" do
        ENV['ACCOUNTS_BUCKET'] = "compartilhaco"
        user = User.create avatar: "messi.png"
        expect(user.avatar_url).to be_eql("https://#{ENV['ACCOUNTS_BUCKET']}.s3.amazonaws.com/uploads/user/avatar/#{user.id}/square_#{user.avatar}")
      end
    end

    context "when the user don't have an avatar" do
      it "should be the default avatar url" do
        user = User.create
        expect(user.avatar_url).to be_eql(ActsAsOurCities.default_avatar_url)
      end
    end
  end

  describe ".create" do
    context "when it is on the API mode" do
      before { allow(ActsAsOurCities).to receive(:api_mode).and_return(true) }

      it "should not create user on database" do
        allow(ActsAsOurCities::API::User).to receive(:create)
        expect {
          User.create first_name: "Leonel", last_name: "Messi"
        }.to_not change{User.count}
      end

      it "should call ActsAsOurCities::API::User.create" do
        params = {first_name: "Leonel", last_name: "Messi"}
        expect(ActsAsOurCities::API::User).to receive(:create).with(params)
        User.create params
      end
    end

    context "when it is not on the API mode" do
      before { allow(ActsAsOurCities).to receive(:api_mode).and_return(false) }

      it "should create user on database" do
        expect {
          User.create first_name: "Leonel", last_name: "Messi"
        }.to change{User.count}.by(1)
      end
    end
  end
end
