RSpec.describe RoadTrip do
  describe 'validations' do
    it { should validate_presence_of :origin }
    it { should validate_presence_of :destination }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end
end
