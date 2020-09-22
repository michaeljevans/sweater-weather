class UnsplashService
  def self.images_by_search(terms)
    domain = 'https://api.unsplash.com'
    uri    = '/search/photos'

    params = {
      client_id: ENV['UNSPLASH_ACCESS_KEY'],
      query: "#{terms.delete(' ')},main,street"
    }

    response = Faraday.get("#{domain}#{uri}") do |req|
      req.headers['Content-Type']   = 'application/json'
      req.headers['Accept-Version'] = 'v1'
      req.params                    = params
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
