class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :visitor
  validates :message,presence: true
  has_many :notifications , as: :notifiable, dependent: :destroy
  def self.search string
    joins(:visitor).where("message Like ? or fullname Like ?", "%#{string}%","%#{string}%")
    #code
  end
  after_save :notify
  def notify
  	notifications.build.save
  end
end
