require "test_helper"

describe LikesStreamsController do
  it "should get index" do
    get :index
    assert_response :success
  end

end
