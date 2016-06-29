class Visitor < ActiveRecord::Base
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :fullname,presence: true
  validates :email,presence: true
end
