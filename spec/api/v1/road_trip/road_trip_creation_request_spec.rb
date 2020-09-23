RSpec.describe 'Road Trip API' do
  it 'can create a road trip with appropriate input' do
    VCR.use_cassette('road_trip_denver_to_vegas', re_record_interval: 7.days) do
      user = User.create!(email: 'whatever@example.com', password: 'password')

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        origin: 'denver, co',
        destination: 'las vegas, nv',
        api_key: user.api_key
      }

      post '/api/v1/road_trip', headers: headers, params: params.to_json

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq('application/json')

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to have_key(:data)
      expect(parsed[:data]).to have_key(:type)
      expect(parsed[:data][:type]).to eq('road trip')
      expect(parsed[:data]).to have_key(:id)
      expect(parsed[:data][:id]).to be_an(Integer)
      expect(parsed[:data]).to have_key(:attributes)
      expect(parsed[:data][:attributes]).to have_key(:origin)
      expect(parsed[:data][:attributes][:origin]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:destination)
      expect(parsed[:data][:attributes][:destination]).to be_a(String)
      expect(parsed[:data][:attributes]).to have_key(:travel_time)
      expect(parsed[:data][:attributes][:travel_time]).to be_a(Integer)
      expect(parsed[:data][:attributes]).to have_key(:arrival_forecast)
      expect(parsed[:data][:attributes][:arrival_forecast]).to have_key(:temp)
      expect(parsed[:data][:attributes][:arrival_forecast][:temp]).to be_a(Float)
      expect(parsed[:data][:attributes][:arrival_forecast]).to have_key(:description)
      expect(parsed[:data][:attributes][:arrival_forecast][:description]).to be_a(String)
    end
  end

  it 'cannot create a road trip without an origin' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      destination: 'las vegas, nv',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip without a destination' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: 'denver, co',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip without an API key' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: 'denver, co',
      destination: 'las vegas, nv'
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip with an empty origin' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: '',
      destination: 'las vegas, nv',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip with an empty destination' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: 'denver, co',
      destination: '',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip with an empty API key' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: 'denver, co',
      destination: 'las vegas, nv',
      api_key: ''
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Origin, destination, and API key are required fields.')
  end

  it 'cannot create a road trip with an invalid API key' do
    user = User.create!(email: 'whatever@example.com', password: 'password')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      origin: 'denver, co',
      destination: 'las vegas, nv',
      api_key: 'not a real api key'
    }

    post '/api/v1/road_trip', headers: headers, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq('Invalid API key.')
  end
end
