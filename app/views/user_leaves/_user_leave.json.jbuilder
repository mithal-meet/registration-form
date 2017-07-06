json.extract! user_leave, :id, :user_id, :leave_type, :leave_taken, :leave_left, :created_at, :updated_at
json.url user_leave_url(user_leave, format: :json)
