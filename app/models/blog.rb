class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  # Associations
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy

  # Scopes
  scope :three_year_recent, -> { where("extract(year from created_at) >= #{Date.current.year - 2}") }
  scope :public_list, -> { includes(:tags).published.order('blogs.created_at DESC') }
  scope :admin_list, -> { includes(:tags).order('blogs.created_at DESC') }
  scope :find_tag, ->(tag_name) { joins(:tags).where("tags.name = '#{tag_name}'") }

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

  def created_at_formated
    created_at.strftime('%b %d, %Y')
  end
end
