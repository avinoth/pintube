class Board < ActiveRecord::Base
  has_many :groupings, dependent: :destroy
  has_many :videos, through: :groupings

  validates :name, presence: true, uniqueness: true
end
