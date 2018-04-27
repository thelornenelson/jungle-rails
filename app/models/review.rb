class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :user, :rating, :description, presence: true
end
