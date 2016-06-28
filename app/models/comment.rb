class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :visitor
  has_many :notifications , as: :notifiable, dependent: :destroy
  def self.search string
    joins(:visitor).where("message Like ? or fullname Like ?", "%#{string}%","%#{string}%")
    #code
  end
end
