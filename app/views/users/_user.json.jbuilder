json.extract! user, :id, :name, :email, :password, :password_confirmation, :english_level, :tecnic_knowledge, :cv_link, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
