json.extract! post, :id, :title, :content, :owner_code, :owner_email, :verified, :board_id, :created_at, :updated_at
json.url post_url(post, format: :json)
