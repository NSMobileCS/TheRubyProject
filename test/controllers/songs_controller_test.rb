require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get songs_dashboard_url
    assert_response :success
  end

  test "should get show" do
    get songs_show_url
    assert_response :success
  end

end
