class Product < ActiveRecord::Base
  mount_uploader :image, ProductImagesUploader

  has_many :reviews
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end
