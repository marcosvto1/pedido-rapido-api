json.category do
    json.(@category, :id, :title, :status)
    json.image_url rails_blob_url(@category.image)
end