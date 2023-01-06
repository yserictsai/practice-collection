json.array!(@products) do |product|
  json.extract! product, :id, :name, :featImage, :description, :price
  json.url product_url(product, format: :json)
end
