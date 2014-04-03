require 'spec_helper'

describe User do

  context "validations check" do

    it "username presence" do
      expect(FactoryGirl.build(:user, :username => "")).not_to be_valid
    end

    it "username uniqueness" do
      FactoryGirl.create(:user)
      expect(FactoryGirl.build(:user)).not_to be_valid
    end

    it "password existence" do
      expect(FactoryGirl.build(:user, :password => "")).not_to be_valid
    end

    it "minimum password length of 6 characters" do
      expect(FactoryGirl.build(:user, password: "12345")).not_to be_valid
    end

    it "session token presence" do
      user = FactoryGirl.create(:user)
      expect(user.session_token).to_not be_nil
    end

  end

  context "methods" do

    it "::find_by_credentials" do
      user = FactoryGirl.create(:user)
      expect(User.find_by_credentials("Joe", "foobar")).to eq(user)
    end


  end

end
