require 'test_helper'

class UpdatingDreamsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
    @dream = create(:dream, user_id: @user.id)
  end

  test 'should update a dream' do
    patch "/v1/dreams/#{@dream.id}",
      { dream:
        { category: "Nightmare" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :success
    assert_equal 'Nightmare', @dream.reload.category
  end

  test 'should not update a dream with a invalid category' do
    patch "/v1/dreams/#{@dream.id}",
      { dream:
        { category: "Day" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
  end

end
