class Video < ActiveRecord::Base
  has_many :groupings, dependent: :destroy
  has_many :boards, through: :groupings

  validates :url, presence: true, uniqueness: true
  validate :youtube_url

  before_save :update_meta_info

  scope :tagged, -> (tags) {where('tags @> ARRAY[?]::varchar[]', [tags].flatten.compact)}

  def self.not_mapped board_id
    joins("LEFT OUTER JOIN (SELECT * FROM groupings WHERE board_id = #{board_id}) g
      ON videos.id = g.video_id WHERE g.video_id IS NULL")
  end

  private

  def youtube_url
    begin
      yt_video.title
    rescue
      errors.add(:url, "could not be processed. Please check if it's a valid YouTube URL.")
    end
  end

  def update_meta_info
    begin
      video = yt_video
      self.title = video.title
      self.description = video.description
      self.tags = video.tags
    rescue
      return false
    end
  end

  def yt_video
    Yt::Video.new url: self.url
  end
end
