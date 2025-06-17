class ListUser < ApplicationTool
  description 'It list of users'

  def call
      User.all.map do |user|
          { name: user.full_name, email: user.email }
      end.to_json
  end
end