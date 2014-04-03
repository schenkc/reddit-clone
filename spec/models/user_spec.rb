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

  it "does not store password" do
    FactoryGirl.create(:user)
    expect(User.find_by(:username => "Joe").password).to be_nil
  end

    it "::find_by_credentials" do
      user = FactoryGirl.create(:user)
      expect(User.find_by_credentials("Joe", "foobar")).to eq(user)
    end

    it "#reset_session_token!" do
      user = FactoryGirl.create(:user)
      session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(session_token)
    end

    context "associations" do

      it { should have_many(:links) }

      it { should have_many(:subs) }

    end



end
