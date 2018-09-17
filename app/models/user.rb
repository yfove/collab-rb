class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :members

  has_many :projects, :through => :messages, dependent: :destroy
  has_many :projects, :through => :members, dependent: :destroy

end
