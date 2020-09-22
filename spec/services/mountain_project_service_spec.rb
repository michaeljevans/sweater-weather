RSpec.describe MountainProjectService do
  it 'returns climbing routes' do
    VCR.use_cassette('climbing_routes_golden_co', re_record_interval: 7.days) do
      latitude = 39.749672
      longitude = -105.216019

      routes = MountainProjectService.new.get_nearby_routes(latitude, longitude)

      expect(routes.class).to eq(Hash)
      expect(routes).to have_key(:routes)
      expect(routes[:routes]).to be_an(Array)
      expect(routes[:routes].first).to have_key(:id)
      expect(routes[:routes].first).to have_key(:name)
      expect(routes[:routes].first).to have_key(:type)
      expect(routes[:routes].first).to have_key(:rating)
      expect(routes[:routes].first).to have_key(:stars)
      expect(routes[:routes].first).to have_key(:starVotes)
      expect(routes[:routes].first).to have_key(:pitches)
      expect(routes[:routes].first).to have_key(:location)
      expect(routes[:routes].first[:location]).to be_an(Array)
      routes[:routes].first[:location].each do |element|
        expect(element).to be_a(String)
      end
      expect(routes[:routes].first).to have_key(:url)
      expect(routes[:routes].first).to have_key(:imgSqSmall)
      expect(routes[:routes].first).to have_key(:imgSmall)
      expect(routes[:routes].first).to have_key(:imgSmallMed)
      expect(routes[:routes].first).to have_key(:imgMedium)
      expect(routes[:routes].first).to have_key(:longitude)
      expect(routes[:routes].first).to have_key(:latitude)
    end
  end
end
