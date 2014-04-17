class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  has_many :reviews
  has_many :products, dependent: :nullify
  has_many :ratings, dependent: :destroy
  has_many :rated_products, through: :ratings, source: :products
end
