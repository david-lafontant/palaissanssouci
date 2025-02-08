json.extract! article, :id, :title, :slug, :content, :poster, :poster_description, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
json.content article.content.to_s
json.poster url_for(article.poster)
