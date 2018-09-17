class User < ApplicationRecord
  has_many :projects, :through => :messages
  has_many :projects, :through => :members

end
