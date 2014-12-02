require "test_helper"

describe Qwatos do
  let(:qwatos) { Qwatos.new }

  it "must be valid" do
    qwatos.must_be :valid?
  end
end
