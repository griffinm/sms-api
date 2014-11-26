require 'rails_helper'

RSpec.describe "authorized_numbers/edit", :type => :view do
  before(:each) do
    @authorized_number = assign(:authorized_number, AuthorizedNumber.create!(
      :phone_number => "MyString"
    ))
  end

  it "renders the edit authorized_number form" do
    render

    assert_select "form[action=?][method=?]", authorized_number_path(@authorized_number), "post" do

      assert_select "input#authorized_number_phone_number[name=?]", "authorized_number[phone_number]"
    end
  end
end
