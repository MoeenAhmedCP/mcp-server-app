# app/tools/create_user_tool.rb
class CreateUserTool < ApplicationTool
  description 'Creats a new user'

  arguments do
    required(:first_name).filled(:string).description("First name of the user")
    required(:last_name).filled(:string).description("Last name of the user")
    optional(:email).filled(:string).description("Email address")
  end

  def call(first_name:, last_name:, email: nil)
    User.create!(first_name: first_name, last_name: last_name, email: email)
  end
end
