RSpec.describe 'Road Trip API' do
  it 'can create a road trip with appropriate input' do
    VCR.use_cassette('road_trip_denver_to_vegas', re_record_interval: 7.days) do
      user = User.create!(email: 'whatever@example.com', password: 'password')

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        origin: 'denver, co',
        destination: 'las vegas, nv',
        api_key: user.api_key
      }

      post '/api/v1/road_trip', headers: headers, params: params.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq('application/json')

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq('road trip')
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to be_an(Integer)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:origin)
      expect(parsed[:data][:attributes][:origin]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:destination)
      expect(parsed[:data][:attributes][:destination]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:travel_time)
      expect(parsed[:data][:attributes][:travel_time]).to be_a(Integer)
      expect(parsed[:data][:attributes]).to have_key(:arrival_forecast)
      expect(parsed[:data][:attributes][:arrival_forecast]).to have_key(:temp)
      expect(parsed[:data][:attributes][:arrival_forecast][:temp]).to be_a(Float)
      expect(parsed[:data][:attributes][:arrival_forecast]).to have_key(:description)
      expect(parsed[:data][:attributes][:arrival_forecast][:description]).to be_a(String)
    end
  end
end
