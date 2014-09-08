class User < ActiveRecord::Base
  devise :database_authenticatable, :validatable
end

