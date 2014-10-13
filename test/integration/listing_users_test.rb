require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user1 = create(:user)
    @user2 = create(:user)
  end

  test 'should return a list of users' do
    get '/v1/users.json'
    assert_response :success
    refute_empty response.body
  end

  test 'should return users filtered by name' do
    get "/v1/users.json?name=#{@user1.name}"
    assert_response :success

    data = JSON.parse(response.body)
    names = data['users'].collect { |u| u['name'] }
    assert_includes names, @user1.name
    refute_includes names, @user2.name
  end

  test 'should return a user by id' do
    get "/v1/users/#{@user1.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal @user1.name, data['users'].first['name']
  end

  test 'returns users in JSON' do
    get '/v1/users', {}, { accept: Mime::JSON }
    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns users in XML' do
    get '/v1/users', {}, { accept: Mime::XML }
    assert_response :success
    assert_equal Mime::XML, response.content_type
  end

end
