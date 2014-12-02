class Qwato < ActiveRecord::Base
  belongs_to :artist
  has_many :likes
  has_many :dislikes
end
