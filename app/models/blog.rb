class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  # Associations
  belongs_to :topic, optional: true
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy

  scope :public_list, -> { includes(:tags).published.order('blogs.created_at DESC') }
  scope :admin_list, -> { includes(:tags).order('blogs.created_at DESC') }
  scope :paging, ->(page) { page_kaminari(page).per(5) }
  scope :find_tag, lambda { |tag_name, page = nil|
    joins(:tags).where("tags.name = '#{tag_name}'").paging(page)
  }
  scope :find_topic, lambda { |topic_name = 'programming', page = nil|
    where(topic_id: TOPIC[topic_name.to_sym]).paging(page)
  }
  scope :popular, ->(topic_name = 'programming') { where(topic_id: TOPIC[topic_name.to_sym]).recent.limit(3) }

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

  def created_at_formated
    created_at.strftime('%b %d, %Y')
  end
end
