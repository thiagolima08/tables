json.extract! item, :id, :name, :price, :quantity, :table_id, :created_at, :updated_at
json.url item_url(item, format: :json)
