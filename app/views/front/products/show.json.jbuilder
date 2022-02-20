json.product do
  json.(@product, :id, :name, :description, :category, :time_to_prepare, :status)
  json.price @product.price.to_i
  json.image_url rails_blob_url(@product.image)
end
