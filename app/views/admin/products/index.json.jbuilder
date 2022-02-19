json.products do
    json.array! @products do |product|
        json.(product, :name, :description, :category, :price, :time_to_prepare, :status)
        json.image_url rails_blob_url(product.image)
    end
end