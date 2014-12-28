require "test_helper"

describe AdminPanelController do
  it "should get index" do
    get :index
    assert_response :success
  end

end
