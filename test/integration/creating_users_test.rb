require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
  end

  test 'should create a user' do
    post '/v1/users',
      { user: { name: "Joe", age: 33, city: "Tulsa", state: "OK" } }

    assert_response :created
    assert_equal Mime::JSON, response.content_type

    data = JSON.parse(response.body)
    assert_equal api_v1_user_url(data['users'].first['id']), response.location
  end

end
