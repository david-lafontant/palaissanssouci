require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      slug: "MyString",
      content: nil,
      poster: nil,
      poster_description: "MyString",
      user: nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[slug]"

      assert_select "input[name=?]", "article[content]"

      assert_select "input[name=?]", "article[poster]"

      assert_select "input[name=?]", "article[poster_description]"

      assert_select "input[name=?]", "article[user_id]"
    end
  end
end
