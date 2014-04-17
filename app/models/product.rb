class Product < ActiveRecord::Base
  mount_uploader :image, ProductImagesUploader

  has_many :reviews
  belongs_to :user

  accepts_nested_attributes_for :reviews

  validates :title, presence: true
  validates :description, presence: true
end
