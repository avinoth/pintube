class Video < ActiveRecord::Base
  before_save :update_meta_info

  def embed
    video = yt_video
    video.embed_html
  end

  def thumbnail
    video = yt_video
    video.thumbnail_url
  end

  private

  def update_meta_info
    video = yt_video
    self.title = video.title
    self.description = video.description
    self.tags = video.tags
  end

  def yt_video
    Yt::Video.new url: self.url
  end

end
