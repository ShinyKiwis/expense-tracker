require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get pages_dashboard_url
    assert_response :success
  end

  test "should get expenses" do
    get pages_expenses_url
    assert_response :success
  end

  test "should get subscriptions" do
    get pages_subscriptions_url
    assert_response :success
  end
end
