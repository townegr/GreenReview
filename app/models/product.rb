class Product < ActiveRecord::Base
  mount_uploader :image, ProductImagesUploader

  has_many :reviews
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :users
  belongs_to :user

  accepts_nested_attributes_for :reviews

  validates :title, presence: true
  validates :description, presence: true
end
