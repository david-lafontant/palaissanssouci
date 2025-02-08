require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    assign(:article, Article.create!(
      title: "Title",
      slug: "Slug",
      content: nil,
      poster: nil,
      poster_description: "Poster Description",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Poster Description/)
    expect(rendered).to match(//)
  end
end
