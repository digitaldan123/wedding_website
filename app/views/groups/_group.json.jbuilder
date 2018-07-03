json.extract! group, :id, :name, :num_of_guests_allowed, :day_before_invite, :day_after_invite, :created_at, :updated_at
json.url group_url(group, format: :json)