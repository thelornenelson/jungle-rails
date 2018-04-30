class User < ActiveRecord::Base

  has_many :reviews

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: { minimum: 6 }

  has_secure_password



end
