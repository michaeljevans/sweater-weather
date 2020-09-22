RSpec.describe 'User login API' do
  it 'allows a user to log in with valid credentials' do
    User.create!(email: 'whatever@example.com', password: 'correctpassword')

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
    expect(response.content_type).to eq('application/json')
  end
end
