require 'rails_helper'

RSpec.describe 'carts/edit', type: :view do
  let(:cart) do
    Cart.create!
  end

  before(:each) do
    assign(:cart, cart)
  end

  it 'renders the edit cart form' do
    render

    assert_select 'form[action=?][method=?]', cart_path(cart), 'post' do
      val(nil)
    end
  end
end
