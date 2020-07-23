require 'test_helper'

class UsersBackofficeControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get users_backoffice_welcome_url
    assert_response :success
  end

end
