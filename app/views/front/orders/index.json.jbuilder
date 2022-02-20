json.orders do
  json.todo do
    json.array! @records[:todo] do |order|
      json.(order, :id, :table, :status, :detail)
      json.order_items do
        json.array! order.order_items, :id, :product, :quantity
      end
    end
  end
  json.doing do
    json.array! @records[:doing] do |order|
      json.(order, :id, :table, :status, :detail)
      json.order_items do
        json.array! order.order_items, :id, :product, :quantity
      end
    end
  end
  json.done do
    json.array! @records[:done] do |order|
      json.(order, :id, :table, :status, :detail)
      json.order_items do
        json.array! order.order_items, :id, :product, :quantity
      end
    end
  end
end
