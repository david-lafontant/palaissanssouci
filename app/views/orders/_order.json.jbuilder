json.extract! order, :id, :first_name, :last_name, :address_line1, :address_line2, :city, :state, :country, :zipcode, :telephone, :intruction, :payment_method, :email, :created_at, :updated_at
json.url order_url(order, format: :json)
