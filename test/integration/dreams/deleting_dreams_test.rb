require 'test_helper'

class DeletingDreamsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
    @dream = create(:dream, user_id: @user.id)
  end

  test 'should delete a dream' do
    delete "/v1/dreams/#{@dream.id}"
    assert_response :no_content
  end

end
