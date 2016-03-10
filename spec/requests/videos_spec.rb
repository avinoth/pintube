require 'rails_helper'

RSpec.describe "Videos" do
  describe "GET /videos" do
    it "should render videos index page" do
      get videos_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET /videos/new" do
    it "should render videos form" do
      get new_video_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
end
