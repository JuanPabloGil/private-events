require 'test_helper'

class EventsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get events_controller_new_url
    assert_response :success
  end

  test "should get show" do
    get events_controller_show_url
    assert_response :success
  end

  test "should get all" do
    get events_controller_all_url
    assert_response :success
  end

end
