json.extract! guest, :id, :name, :email, :day_before, :day_after, :food, :dietary_restrictions, :address, :auth_token, :group_id, :created_at, :updated_at
json.url guest_url(guest, format: :json)