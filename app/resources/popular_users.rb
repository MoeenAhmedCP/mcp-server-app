# app/resources/popular_users.rb
class PopularUsers < ApplicationResource
  uri "file://popular_users.json"
  resource_name "Popular Users"
  mime_type "application/json"

  def content
    JSON.generate(User.active.limit(5).as_json)
  end
end
