class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :title, presence: true
  validates :content,presence: true
  def self.search(search)
    where("title LIKE ? or content LIKE ?", "%#{search}%","%#{search}%")

  end
  def self.filter_by_tag params_tag
    includes(:tags).where(publish: true , tags:{name: params_tag}).order(created_at: :DESC)
  end
end
