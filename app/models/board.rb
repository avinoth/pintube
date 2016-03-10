class Board < ActiveRecord::Base
  has_many :groupings, dependent: :destroy
  has_many :videos, through: :groupings
end
