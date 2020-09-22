class User < ApplicationRecord
  has_secure_password
  before_create :generate_api_key

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, uniqueness: true

  private

  def generate_api_key
    new_api_key = SecureRandom.urlsafe_base64
    user = User.exists?(api_key: new_api_key)
    if user.nil?
      self.api_key = new_api_key
    else
      generate_api_key
    end
  end
end
