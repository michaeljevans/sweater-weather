RSpec.describe UnsplashService do
  it 'returns images based on search' do
    VCR.use_cassette('unsplash_denver', re_record_interval: 7.days) do
      terms = 'denver,co'

      images = UnsplashService.images_by_search(terms)

      expect(images).to be_a(Hash)
      expect(images).to have_key(:results)
      expect(images[:results]).to be_an(Array)
      expect(images[:results].first).to have_key(:urls)
      expect(images[:results].first[:urls]).to have_key(:raw)
      expect(images[:results].first[:urls][:raw]).to be_a(String)
      expect(images[:results].first).to have_key(:user)
      expect(images[:results].first[:user]).to have_key(:username)
      expect(images[:results].first[:user][:username]).to be_a(String)
    end
  end
end
