json.product do
    json.(@product, :id, :name, :description, :category, :price, :time_to_prepare, :status)
    json.image_url rails_blob_url(@product.image)
end