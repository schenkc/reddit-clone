require 'spec_helper'

describe Link do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:submitter_id) }
  end

  context "associations" do
    it { should have_many(:sub_connections) }
    it { should have_many(:subs) }
    it { should belong_to(:submitter) }
    it { should have_many(:comments) }
  end

end
