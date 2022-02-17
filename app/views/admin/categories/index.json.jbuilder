json.categories do
    json.array! @categories do |category|
        json.(category, :id, :title, :status)
        json.image_url rails_blob_url(category.image)
    end
end