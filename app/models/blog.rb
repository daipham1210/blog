class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  # Associations
  belongs_to :topic, optional: true
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments, as: :creator, class_name: 'Commontator::Comment'

  acts_as_commontable dependent: :destroy

  scope :public_list, -> { includes(:tags).order('blogs.created_at DESC') }
  scope :admin_list, -> { includes(:tags).published.order('blogs.created_at DESC') }
  scope :find_tag, ->(tag_name) { joins(:tags).where("tags.name = '#{tag_name}'") }

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order('created_at DESC')
  end

  def tag_list
    tags.select(:name, :background, :color)
  end

  def tag_list=(names)
    return unless names

    self.tags = names.map { |n| Tag.find_by(name: n) }
  end
end
