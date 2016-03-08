module VideosHelper

  def embed_video url
    yt_video(url).embed_html
  end

  def thumbnail_for url
    yt_video(url).thumbnail_url
  end

  def yt_video url
    Yt::Video.new url: url
  end

end
