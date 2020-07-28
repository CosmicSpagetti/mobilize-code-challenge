class User < ApplicationRecord
  has_secure_password
   validates_presence_of :name,
                         :phone_number,
                         :password_digest
end
