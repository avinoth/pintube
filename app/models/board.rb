class Board < ActiveRecord::Base
  has_many :groupings
  has_many :videos, through: :groupings
end
