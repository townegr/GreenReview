class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
end
