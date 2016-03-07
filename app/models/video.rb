class Video < ActiveRecord::Base
  before_save :update_meta_info

  private

  def update_meta_info
    video = Yt::Video.new url: self.url
    self.title = video.title
    self.description = video.description
    self.tags = video.tags
  end

end
