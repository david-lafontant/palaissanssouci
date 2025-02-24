require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  let(:article) do
    Article.create!(
      title: 'MyString',
      slug: 'MyString',
      content: nil,
      poster: nil,
      poster_description: 'MyString',
      user: nil
    )
  end

  before(:each) do
    assign(:article, article)
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(article), 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'input[name=?]', 'article[slug]'

      assert_select 'input[name=?]', 'article[content]'

      assert_select 'input[name=?]', 'article[poster]'

      assert_select 'input[name=?]', 'article[poster_description]'

      assert_select 'input[name=?]', 'article[user_id]'
    end
  end
end
