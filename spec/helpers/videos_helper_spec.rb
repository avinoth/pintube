require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the VideosHelper. For example:
#
# describe VideosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe VideosHelper do
  before(:each) do
    @video = Video.create url: "https://www.youtube.com/watch?v=9bZkp7q19f0"
  end

  describe "embed_video" do
    it "returns iframe tag for a video URL" do
      expect(embed_video(@video.url)).to eq(yt_video(@video.url).embed_html)
    end
  end

  describe "thumbnail_for" do
    it "returns the thumbnail image for a video URL" do
      expect(thumbnail_for(@video.url)).to eq(yt_video(@video.url).thumbnail_url)
    end
  end
end
