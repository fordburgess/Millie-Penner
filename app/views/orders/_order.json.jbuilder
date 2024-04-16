json.extract! order, :id, :name, :email, :product, :address, :pay_method, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
