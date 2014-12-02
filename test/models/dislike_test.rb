require "test_helper"

describe Dislike do
  let(:dislike) { Dislike.new }

  it "must be valid" do
    dislike.must_be :valid?
  end
end
