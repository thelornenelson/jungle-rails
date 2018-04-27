class User < ActiveRecord::Base

  has_many :reviews

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true

  has_secure_password



end
