json.products do
  json.array! @products do |product|
    json.(product, :id, :name, :description, :time_to_prepare, :status)
    json.price product.price.to_f
    json.image_url rails_blob_url(product.image) if product.image.attached?
  end
end
