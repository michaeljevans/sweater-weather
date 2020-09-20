class Location
  attr_reader :city, :state, :country, :latitude, :longitude

  def initialize(location_info)
    @city      = location_info[:adminArea5]
    @state     = location_info[:adminArea3]
    @country   = location_info[:adminArea1]
    @latitude  = location_info[:latLng][:lat]
    @longitude = location_info[:latLng][:lng]
  end
end
