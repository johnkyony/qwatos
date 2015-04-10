require "test_helper"

describe TrendingController do
  it "should get index" do
    get :index
    assert_response :success
  end

end
