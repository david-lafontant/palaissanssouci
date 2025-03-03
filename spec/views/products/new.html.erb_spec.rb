require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, Product.new(
                       name: 'MyString',
                       description: 'MyText',
                       price: '9.99',
                       pictures: nil,
                       category: nil
                     ))
  end

  it 'renders new product form' do
    render

    assert_select 'form[action=?][method=?]', products_path, 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'textarea[name=?]', 'product[description]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[pictures]'

      assert_select 'input[name=?]', 'product[category_id]'
    end
  end
end
