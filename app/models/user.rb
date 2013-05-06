class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :email, :password, :password_confirmation

  acts_as_authentic do |c|
    c.login_field = 'email'
  end
end
