require "rails_helper"

RSpec.describe AuthorizedNumbersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/authorized_numbers").to route_to("authorized_numbers#index")
    end

    it "routes to #new" do
      expect(:get => "/authorized_numbers/new").to route_to("authorized_numbers#new")
    end

    it "routes to #show" do
      expect(:get => "/authorized_numbers/1").to route_to("authorized_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/authorized_numbers/1/edit").to route_to("authorized_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/authorized_numbers").to route_to("authorized_numbers#create")
    end

    it "routes to #update" do
      expect(:put => "/authorized_numbers/1").to route_to("authorized_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/authorized_numbers/1").to route_to("authorized_numbers#destroy", :id => "1")
    end

  end
end
