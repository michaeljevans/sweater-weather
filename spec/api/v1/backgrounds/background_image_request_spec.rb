RSpec.describe 'Background Image API' do
  it 'returns a background image based on search terms' do
    VCR.use_cassette('background_image_denver_co', re_record_interval: 7.days) do
      location = 'denver,co'

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      background = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
