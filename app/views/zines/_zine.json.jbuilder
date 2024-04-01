json.extract! zine, :id, :title, :price, :size, :pages, :description, :created_at, :updated_at
json.url zine_url(zine, format: :json)
