require 'rails_helper'

RSpec.describe "authorized_numbers/index", :type => :view do
  before(:each) do
    assign(:authorized_numbers, [
      AuthorizedNumber.create!(
        :phone_number => "Phone Number"
      ),
      AuthorizedNumber.create!(
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of authorized_numbers" do
    render
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
