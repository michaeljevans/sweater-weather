RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :api_key }
  end

  describe 'relationships' do
    it { should have_many :road_trips }
  end

  describe 'class methods' do
    it '.generate_api_key' do
      user_info = { email: 'whatever@example.com', password: 'password' }
      user = User.create!(user_info)

      expect(user).to be_a(User)
      expect(user.email).to eq(user_info[:email])
      expect(user.password).to eq(user_info[:password])
      expect(user.api_key).to be_a(String)

      user_2_info = { email: 'whocares@example.com', password: 'password', api_key: user.api_key }

      expect { User.create!(user_2_info) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
