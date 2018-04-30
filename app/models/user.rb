class User < ActiveRecord::Base

  has_many :reviews

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  def self.ci_find(attribute, value)
    where("lower(#{attribute}) = ?", value.downcase).first
  end

  def self.authenticate_with_credentials(email, password)
    user = User.ci_find('email', email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end



end
