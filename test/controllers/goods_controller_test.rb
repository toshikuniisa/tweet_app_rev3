require 'test_helper'

class GoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get goods_create_url
    assert_response :success
  end

  test "should get destory" do
    get goods_destory_url
    assert_response :success
  end

end
