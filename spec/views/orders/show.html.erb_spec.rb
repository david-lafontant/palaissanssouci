require 'rails_helper'

RSpec.describe 'orders/show', type: :view do
  before(:each) do
    assign(:order, Order.create!(
                     first_name: 'First Name',
                     last_name: 'Last Name',
                     address_line1: 'Address Line1',
                     address_line2: 'Address Line2',
                     city: 'City',
                     state: 'State',
                     country: 'Country',
                     zipcode: 'Zipcode',
                     telephone: 'Telephone',
                     intruction: 'MyText',
                     payment_method: 2,
                     email: 'Email'
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Address Line1/)
    expect(rendered).to match(/Address Line2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Zipcode/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
  end
end
