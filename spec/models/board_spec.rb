require 'rails_helper'

RSpec.describe Board do
  describe "validations" do
    it { should validate_presence_of(:name) }

    subject { Board.new(name: "Fun") }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should have_many(:groupings).dependent(:destroy) }
    it { should have_many(:videos).through(:groupings) }
  end
end
