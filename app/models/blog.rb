class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  # Associations
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order('created_at DESC')
  end

  def all_tags
    tags.select(:name, :background, :color)
  end

  def tag_list=(names)
    self.tags = names.map { |n| Tag.where(name: n).first_or_create! }
  end
end
