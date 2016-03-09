require 'rails_helper'

RSpec.describe Video do

  describe Video do
    describe "validations" do
      it { should validate_presence_of(:url) }
      it { should allow_value('https://www.youtube.com/watch?v=9bZkp7q19f0').for(:url) }
      it { should_not allow_value('abc').for(:url) }
      subject { Video.new(url: "https://www.youtube.com/watch?v=VugtWhufJhI") }
      it { should validate_uniqueness_of(:url) }
    end

    it "should update video meta information" do
      video = Video.create url: "https://www.youtube.com/watch?v=ztMIb6nEeyg"
      expect(video.title).to eq("International Women's Day Doodle 2016: #OneDayIWill")
      expect(video.description).to start_with("Over the years")
      expect(video.tags.size).to be > 1
    end
  end
end
