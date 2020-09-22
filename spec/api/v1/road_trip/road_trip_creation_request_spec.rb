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

      post '/api/v1/road_trip', headers: headers, params: params

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq('application/json')
    end
  end
end
