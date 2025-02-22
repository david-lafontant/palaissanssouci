require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        country: "Country",
        zipcode: "Zipcode",
        telephone: "Telephone",
        intruction: "MyText",
        payment_method: 2,
        email: "Email"
      ),
      Order.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address_line1: "Address Line1",
        address_line2: "Address Line2",
        city: "City",
        state: "State",
        country: "Country",
        zipcode: "Zipcode",
        telephone: "Telephone",
        intruction: "MyText",
        payment_method: 2,
        email: "Email"
      )
    ])
  end

  it "renders a list of orders" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Line1".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address Line2".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("City".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("State".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Zipcode".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Telephone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  end
end
