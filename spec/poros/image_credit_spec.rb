RSpec.describe ImageCredit do
  it 'exists and has attributes' do
    artist_info = {
      username: 'itsyaboi'
    }

    credit = ImageCredit.new(artist_info)

    expect(credit).to be_an(ImageCredit)
    expect(credit.source).to eq('unsplash.com')
    expect(credit.artist).to eq(artist_info[:username])
    expect(credit.logo).to eq('https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60')
  end
end
