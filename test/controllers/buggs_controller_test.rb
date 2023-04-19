require "test_helper"

class BuggsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bugg = buggs(:one)
  end

  test "should get index" do
    get buggs_url
    assert_response :success
  end

  test "should get new" do
    get new_bugg_url
    assert_response :success
  end

  test "should create bugg" do
    assert_difference("Bugg.count") do
      post buggs_url, params: { bugg: {} }
    end

    assert_redirected_to bugg_url(Bugg.last)
  end

  test "should show bugg" do
    get bugg_url(@bugg)
    assert_response :success
  end

  test "should get edit" do
    get edit_bugg_url(@bugg)
    assert_response :success
  end

  test "should update bugg" do
    patch bugg_url(@bugg), params: { bugg: {} }
    assert_redirected_to bugg_url(@bugg)
  end

  test "should destroy bugg" do
    assert_difference("Bugg.count", -1) do
      delete bugg_url(@bugg)
    end

    assert_redirected_to buggs_url
  end
end
