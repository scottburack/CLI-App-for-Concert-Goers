class User < ActiveRecord::Base

  has_many :follows
  has_many :artists, through: :follows

end
