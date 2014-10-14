require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @dream1 = create(:dream)
    @dream2 = create(:dream)
  end

  test 'should return a list of dreams' do
    get '/v1/dreams.json'
    assert_response :success
    refute_empty response.body
  end

  test 'should return dreams filtered by category' do
    get "/v1/dreams.json?category=#{@dream1.category}"
    assert_response :success

    data = JSON.parse(response.body)
    categories = data['dreams'].collect { |u| u['category'] }
    assert_includes categories, @dream1.category
    refute_includes categories, @dream2.category
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
