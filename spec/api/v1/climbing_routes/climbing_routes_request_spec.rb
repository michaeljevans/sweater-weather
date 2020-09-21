RSpec.describe 'Climbing Routes API' do
  it 'returns nearby climbing routes and weather for a location' do
    VCR.use_cassette('climbing_routes_golden_co', re_record_interval: 7.days) do
      location = 'golden,co'

      get "/api/v1/climbing_routes?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      routes = JSON.parse(response.body, symbolize_names: true)

      expect(routes.class).to eq(Hash)
      expect(routes).to have_key(:data)
      expect(routes[:data]).to have_key(:id)
      expect(routes[:data]).to have_key(:type)
      expect(routes[:data]).to have_key(:attributes)
      expect(routes[:data][:attributes]).to have_key(:location)
      expect(routes[:data][:attributes]).to have_key(:forecast)
      expect(routes[:data][:attributes][:forecast]).to have_key(:summary)
      expect(routes[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(routes[:data][:attributes]).to have_key(:routes)
      expect(routes[:data][:attributes][:routes]).to have_key(:name)
      expect(routes[:data][:attributes][:routes]).to have_key(:type)
      expect(routes[:data][:attributes][:routes]).to have_key(:rating)
      expect(routes[:data][:attributes][:routes]).to have_key(:location)
      expect(routes[:data][:attributes][:routes][:location]).to be_an(Array)
      expect(routes[:data][:attributes][:routes][:location].length).to eq(4)
      routes[:data][:attributes][:routes][:location].each do |element|
        expect(element).to be_a(String)
      end
      expect(routes[:data][:attributes][:routes]).to have_key(:distance_to_route)
    end
  end
end
