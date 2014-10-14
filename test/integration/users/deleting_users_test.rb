require 'test_helper'

class DeletingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
  end

  test 'should delete a user' do
    delete "/v1/users/#{@user.id}"
    assert_response :no_content
  end

end
