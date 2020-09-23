class ImageCredit
  attr_reader :source, :artist, :logo

  def initialize(artist_info)
    @source = image_domain
    @artist = artist_info[:username]
    @logo   = source_logo
  end

  private

  def image_domain
    'unsplash.com'
  end

  def source_logo
    'https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60'
  end
end
