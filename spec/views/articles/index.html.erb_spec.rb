require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  before(:each) do
    assign(:articles, [
             Article.create!(
               title: 'Title',
               slug: 'Slug',
               content: nil,
               poster: nil,
               poster_description: 'Poster Description',
               user: nil
             ),
             Article.create!(
               title: 'Title',
               slug: 'Slug',
               content: nil,
               poster: nil,
               poster_description: 'Poster Description',
               user: nil
             )
           ])
  end

  it 'renders a list of articles' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Slug'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Poster Description'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
