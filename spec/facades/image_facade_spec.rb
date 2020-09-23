RSpec.describe ImageFacade do
  it 'exists and has attributes' do
    VCR.use_cassette('unsplash_denver') do
      search_term = 'denver,co'

      image = ImageFacade.new(search_term)

      expect(image).to be_an(ImageFacade)
      expect(image.location).to eq('denver,co')
      expect(image.image_url).to be_a(String)
      expect(image.credit).to be_an(ImageCredit)
    end
  end
end
