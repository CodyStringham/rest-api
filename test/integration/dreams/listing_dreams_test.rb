require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
    @user2 = create(:user)
    @dream1 = create(:dream, user_id: @user.id)
    @dream2 = create(:dream, user_id: @user2.id)
  end

  test 'should return a list of dreams' do
    get '/v1/dreams.json'
    assert_response :success
    refute_empty response.body
  end

  test 'should return dreams filtered by user_id' do
    get "/v1/dreams.json?user_id=#{@dream1.user_id}"
    assert_response :success

    data = JSON.parse(response.body)
    users = data['dreams'].collect { |u| u['user_id'] }
    assert_includes users, @dream1.user_id
    refute_includes users, @dream2.user_id
  end

  test 'should return a dream by id' do
    get "/v1/dreams/#{@dream1.id}.json"
    assert_response :success

    data = JSON.parse(response.body)
    assert_equal @dream1.id, data['dreams'].first['id']
  end

  test 'returns dreams in JSON' do
    get '/v1/dreams', {}, { accept: Mime::JSON }
    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns dreams in XML' do
    get '/v1/dreams', {}, { accept: Mime::XML }
    assert_response :success
    assert_equal Mime::XML, response.content_type
  end

end
