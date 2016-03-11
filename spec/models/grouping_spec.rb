require 'rails_helper'

RSpec.describe Grouping do
  describe "validations" do
    it { should validate_presence_of(:board_id) }
    it { should validate_presence_of(:video_id) }

    subject { Grouping.new({board_id: 1, video_id: 2}) }
    it { should validate_uniqueness_of(:board_id).scoped_to(:video_id) }
  end

  describe "associations" do
    it { should belong_to(:board) }
    it { should belong_to(:video) }
  end

end
