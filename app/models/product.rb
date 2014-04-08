class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :reviews
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end
