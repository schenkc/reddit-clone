require 'spec_helper'

describe Sub do
  context "validates" do

    it { should validate_presence_of(:name) }
    it "uniqueness of name" do
      Sub.new(name: 'aww', mod_id: 1).save!(validate: false)
      should validate_uniqueness_of(:name)
    end

    it { should validate_presence_of(:mod_id) }

  end

  describe "associations" do

    it { should belong_to(:moderator) }

    it { should have_many(:links) }

    it { should have_many(:link_connections) }


  end

end
