class ImageFacade
  attr_reader :location, :image_url, :credit

  def initialize(location)
    @location  = location
    @image_url = url
    @credit    = image_credit
  end

  private

  def image_search
    @images ||= UnsplashService.images_by_search(@location)
  end

  def url
    image_search[:results].first[:urls][:raw]
  end

  def image_credit
    ImageCredit.new(image_search[:results].first[:user])
  end
end
