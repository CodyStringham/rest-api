require 'test_helper'

class CreatingDreamsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.example.com' #required for testing with a subdomain constraint
    @user = create(:user)
  end

  test 'should create a dream' do
    post '/v1/dreams',
      { dream:
        { user_id: @user.id, date: Time.now, category: "Nightmare", description: "Dreams are cool!" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :created
    assert_equal Mime::JSON, response.content_type

    data = JSON.parse(response.body)
    assert_equal api_v1_dream_url(data['dreams'].first['id']), response.location
  end

  test 'should not create a dream without a date' do
    post '/v1/dreams',
      { dream:
        { user_id: @user.id, date: nil, category: "Nightmare", description: "Dreams are cool!" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a dream without an category' do
    post '/v1/dreams',
      { dream:
        { user_id: @user.id, date: Time.now, category: nil, description: "Dreams are cool!" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a dream without a description' do
    post '/v1/dreams',
      { dream:
        { user_id: @user.id, date: Time.now, category: "Nightmare", description: nil }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  test 'should not create a dream without a user' do
    post '/v1/dreams',
      { dream:
        { user_id: nil, date: Time.now, category: "Nightmare", description: "Dreams are cool!" }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

end
