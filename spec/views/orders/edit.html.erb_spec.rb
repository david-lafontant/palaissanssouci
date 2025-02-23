require 'rails_helper'

RSpec.describe 'orders/edit', type: :view do
  let(:order) do
    Order.create!(
      first_name: 'MyString',
      last_name: 'MyString',
      address_line1: 'MyString',
      address_line2: 'MyString',
      city: 'MyString',
      state: 'MyString',
      country: 'MyString',
      zipcode: 'MyString',
      telephone: 'MyString',
      intruction: 'MyText',
      payment_method: 1,
      email: 'MyString'
    )
  end

  before(:each) do
    assign(:order, order)
  end

  it 'renders the edit order form' do
    render

    assert_select 'form[action=?][method=?]', order_path(order), 'post' do
      assert_select 'input[name=?]', 'order[first_name]'

      assert_select 'input[name=?]', 'order[last_name]'

      assert_select 'input[name=?]', 'order[address_line1]'

      assert_select 'input[name=?]', 'order[address_line2]'

      assert_select 'input[name=?]', 'order[city]'

      assert_select 'input[name=?]', 'order[state]'

      assert_select 'input[name=?]', 'order[country]'

      assert_select 'input[name=?]', 'order[zipcode]'

      assert_select 'input[name=?]', 'order[telephone]'

      assert_select 'textarea[name=?]', 'order[intruction]'

      assert_select 'input[name=?]', 'order[payment_method]'

      assert_select 'input[name=?]', 'order[email]'
    end
  end
end
