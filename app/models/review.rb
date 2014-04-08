class Review < ActiveRecord::Base
  validates :description, presence: true
  validates :product, presence: true
  validates :user, presence: true

  belongs_to :product
  belongs_to :user
end
