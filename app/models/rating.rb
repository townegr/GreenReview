class Rating < ActiveRecord::Base
  validates :user, presence: true
  validates :product, presence: true
  validates :stars, presence: true

  belongs_to :user
  belongs_to :product
end
