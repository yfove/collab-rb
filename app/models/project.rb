class Project < ApplicationRecord
  has_many :users, :through => :members
  has_many :users, :through => :messages

end
