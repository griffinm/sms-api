require 'rails_helper'

RSpec.describe "AuthorizedNumbers", :type => :request do
  describe "GET /authorized_numbers" do
    it "works! (now write some real specs)" do
      get authorized_numbers_path
      expect(response).to have_http_status(200)
    end
  end
end
