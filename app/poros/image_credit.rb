class ImageCredit
  attr_reader :source, :artist, :logo

  def initialize(artist_info)
    @source = 'unsplash.com'
    @artist = artist_info[:username]
    @logo   = 'https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60'
  end
end
