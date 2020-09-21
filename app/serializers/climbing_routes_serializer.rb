class ClimbingRoutesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :routes
  set_id 'nil?'
end
