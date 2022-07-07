require "test_helper"

class MessageControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get message_message_url
    assert_response :success
  end
end
