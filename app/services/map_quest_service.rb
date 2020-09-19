class MapQuestService
  def get_location_information(location)
    response = connection.get('address?') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['key']           = ENV['MAPQUEST_API_KEY']
      f.params['location']      = location
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def url
    'http://www.mapquestapi.com/geocoding/v1/'
  end

  def connection
    Faraday.new(url)
  end
end
