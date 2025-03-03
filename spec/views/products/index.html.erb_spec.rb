require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               name: 'Name',
               description: 'MyText',
               price: '9.99',
               pictures: nil,
               category: nil
             ),
             Product.create!(
               name: 'Name',
               description: 'MyText',
               price: '9.99',
               pictures: nil,
               category: nil
             )
           ])
  end

  it 'renders a list of products' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Name'), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
