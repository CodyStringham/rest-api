require 'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' } #required for testing with a subdomain constraint

  test 'should return a list of users' do
    get '/v1/users.json'
    assert_response :success
    refute_empty response.body
  end

end
