require 'rails_helper'

RSpec.describe "authorized_numbers/new", :type => :view do
  before(:each) do
    assign(:authorized_number, AuthorizedNumber.new(
      :phone_number => "MyString"
    ))
  end

  it "renders new authorized_number form" do
    render

    assert_select "form[action=?][method=?]", authorized_numbers_path, "post" do

      assert_select "input#authorized_number_phone_number[name=?]", "authorized_number[phone_number]"
    end
  end
end
