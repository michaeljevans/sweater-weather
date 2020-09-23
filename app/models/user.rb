class User < ApplicationRecord
  before_create :generate_api_key

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, uniqueness: true

  has_many :road_trips

  has_secure_password

  private

  def generate_api_key
    new_api_key = SecureRandom.urlsafe_base64
    if User.exists?(api_key: new_api_key)
      generate_api_key
    else
      self.api_key = new_api_key
    end
  end
end
