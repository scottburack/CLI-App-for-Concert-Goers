class User < ActiveRecord::Base

  has_many :follows
  has_many :artists, through: :follows

  def find_or_create_by_name(name)
    user = User.find_by(name: name)
    if user
      return "Hello, #{user.name}!"
    else
      User.create(name: name)
      return "Welcome, #{name}!"
    end
  end

end
