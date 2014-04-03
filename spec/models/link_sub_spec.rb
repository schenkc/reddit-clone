require 'spec_helper'

describe LinkSub do

  context "validations" do
  it { should validate_presence_of(:link_id) }
  it { should validate_presence_of(:sub_id) }

  end


  context "associations" do
    it { should belong_to(:link) }
    it { should belong_to(:sub) }
  end
end
