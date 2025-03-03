require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  let(:product) do
    Product.create!(
      name: 'MyString',
      description: 'MyText',
      price: '9.99',
      pictures: nil,
      category: nil
    )
  end

  before(:each) do
    assign(:product, product)
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(product), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'textarea[name=?]', 'product[description]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[pictures]'

      assert_select 'input[name=?]', 'product[category_id]'
    end
  end
end
