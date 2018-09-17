class User < ApplicationRecord
  has_secure_password
  has_many :projects, :through => :messages
  has_many :projects, :through => :members

end
