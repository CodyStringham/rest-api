require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
  end

  test 'should create a user' do
    post '/v1/users',
      { user:
        { name: "Joe", age: 33, city: "Tulsa", state: "OK" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :created
    assert_equal Mime::JSON, response.content_type

    data = JSON.parse(response.body)
    assert_equal api_v1_user_url(data['users'].first['id']), response.location
  end

  test 'should not create a user without a name' do
    post '/v1/users',
      { user:
        { name: nil, age: 33, city: "Tulsa", state: "OK" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a user without an age' do
    post '/v1/users',
      { user:
        { name: "Phil", age: nil, city: "Tulsa", state: "OK" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a user without a city' do
    post '/v1/users',
      { user:
        { name: "Jim", age: 33, city: nil, state: "OK" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a user without a state' do
    post '/v1/users',
      { user:
        { name: "Billy", age: 33, city: "Tulsa", state: nil }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

end
