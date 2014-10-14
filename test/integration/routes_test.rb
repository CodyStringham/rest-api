require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest

  test 'routes use the correct version' do
    assert_generates '/v1/users', { controller: 'api/v1/users', action: 'index' }
    # assert_generates '/v2/users', { controller: 'api/v2/users', action: 'index' }
  end

end
