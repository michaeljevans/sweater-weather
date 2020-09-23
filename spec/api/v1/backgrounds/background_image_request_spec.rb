RSpec.describe 'Background Image API' do
  it 'returns a background image based on search terms' do
    VCR.use_cassette('unsplash_denver', re_record_interval: 7.days) do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      location = 'denver,co'

      get "/api/v1/backgrounds?location=#{location}", headers: headers

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:data)

      image = parsed[:data]

      expect(image).to have_key(:id)
      expect(image[:id]).to eq(nil)
      expect(image).to have_key(:type)
      expect(image[:type]).to eq('image')

      expect(image).to have_key(:attributes)
      expect(image[:attributes]).to have_key(:location)
      expect(image[:attributes][:location]).to be_a(String)
      expect(image[:attributes][:location]).to eq('denver,co')

      expect(image[:attributes]).to have_key(:image_url)
      expect(image[:attributes][:image_url]).to be_a(String)

      expect(image[:attributes]).to have_key(:credit)
      expect(image[:attributes][:credit]).to have_key(:source)
      expect(image[:attributes][:credit][:source]).to eq('unsplash.com')
      expect(image[:attributes][:credit]).to have_key(:artist)
      expect(image[:attributes][:credit][:artist]).to be_a(String)
      expect(image[:attributes][:credit]).to have_key(:logo)
      expect(image[:attributes][:credit][:logo]).to eq('https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60')
    end
  end
end
