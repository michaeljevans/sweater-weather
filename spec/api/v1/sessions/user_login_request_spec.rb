RSpec.describe 'User login API' do
  it 'allows a user to log in with valid credentials' do
    user = User.create!(email: 'whatever@example.com', password: 'correctpassword')

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    params = {
      email: 'whatever@example.com',
      password: 'correctpassword'
    }

    post '/api/v1/sessions', headers: headers, params: params.to_json

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to be_a(Hash)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq('users')
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(user.id)
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes][:email]).to eq(user.email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
