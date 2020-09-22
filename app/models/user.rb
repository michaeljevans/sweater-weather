class User < ApplicationRecord
  before_create :generate_api_key

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, uniqueness: true

  has_secure_password

  private

  def generate_api_key
    new_api_key = SecureRandom.urlsafe_base64
    user = User.find_by(api_key: new_api_key)
    self.api_key = new_api_key if user.nil?
  end
end
