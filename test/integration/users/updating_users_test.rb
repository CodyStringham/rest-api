require 'test_helper'

class UpdatingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
  end

  test 'should update a user' do
    patch "/v1/users/#{@user.id}",
      { user:
        { name: "Stiffmiester" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :success
    assert_equal 'Stiffmiester', @user.reload.name
  end

  test 'should not update a user with a invalid age' do
    patch "/v1/users/#{@user.id}",
      { user:
        { age: 250 }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
  end

end
