require 'rails_helper'

RSpec.describe "authorized_numbers/show", :type => :view do
  before(:each) do
    @authorized_number = assign(:authorized_number, AuthorizedNumber.create!(
      :phone_number => "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Number/)
  end
end
