class Grouping < ActiveRecord::Base
  belongs_to :board
  belongs_to :video

  validates :board_id, :video_id, presence: true

  validates :board_id, uniqueness: {scope: :video_id}
end
