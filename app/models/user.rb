class User < ActiveRecord::Base
  has_secure_password
  class NotAuthorized < StandardError
  end
end
