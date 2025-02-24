json.extract! product, :id, :name, :description, :price, :pictures, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
json.pictures do
  json.array!(product.pictures) do |picture|
    json.id picture.id
    json.url url_for(picture)
  end
end
