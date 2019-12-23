class Tag < ApplicationRecord
  has_many :taggings
  has_many :blogs, through: :taggings

  validates :color, :background, presence: true

  after_initialize do |tag|
    tag.background ||= Random.bytes(3).unpack1('H*')
    tag.color      ||= '#FFFFFF'
  end
end
