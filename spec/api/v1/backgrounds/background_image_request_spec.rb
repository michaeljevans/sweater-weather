RSpec.describe 'Background Image API' do
  it 'returns a background image based on search terms' do
    VCR.use_cassette('unsplash_denver', re_record_interval: 7.days) do
      location = 'denver,co'

      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      expect(response.content_type).to eq('application/json')

      payload = JSON.parse(response.body, symbolize_names: true)

      expect(payload).to be_a(Hash)
      expect(payload).to have_key(:data)

      image = payload[:data]

      expect(image).to have_key(:id)
      expect(image[:id]).to eq(nil)
      expect(image).to have_key(:type)
      expect(image[:type]).to eq('image')

      expect(image).to have_key(:image)
      expect(image[:image]).to have_key(:location)
      expect(image[:image][:location]).to be_a(String)
      expect(image[:image][:location]).to eq('denver,co')

      expect(image[:image]).to have_key(:image_url)
      expect(image[:image][:image_url]).to be_a(String)

      expect(image[:image]).to have_key(:credit)
      expect(image[:image][:credit]).to have_key(:source)
      expect(image[:image][:credit][:source]).to eq('unsplash.com')
      expect(image[:image][:credit]).to have_key(:artist)
      expect(image[:image][:credit][:artist]).to be_a(String)
      expect(image[:image][:credit]).to have_key(:logo)
      expect(image[:image][:credit][:logo]).to eq('https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60')
    end
  end
end
