require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    it "homepage exist " do
      get root_path
      response.status.should be(200)
    end
  end
end
