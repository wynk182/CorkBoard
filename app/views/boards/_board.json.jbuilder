json.extract! board, :id, :name, :location_id, :owned, :created_at, :updated_at
json.url board_url(board, format: :json)
