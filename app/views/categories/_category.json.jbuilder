json.extract! category, :id, :name, :picture, :created_at, :updated_at
json.url category_url(category, format: :json)
json.picture url_for(category.picture)
