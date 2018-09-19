class Project < ApplicationRecord
  has_many :members
  has_many :messages

  has_many :users, :through => :members, dependent: :destroy
  has_many :users, :through => :messages, dependent: :destroy

  has_many :categorizations
  has_many :categories, through: :categorizations
end
