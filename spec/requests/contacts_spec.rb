require 'spec_helper'

describe "Contacts" do
  describe "GET /contacts" do
    it "works! (now write some real specs)" do
      get contacts_path
      response.status.should be(200)
    end
  end
end
