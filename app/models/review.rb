class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :user, :rating, presence: true
end
