class Project < ApplicationRecord
  has_many :members
  has_many :messages

  has_many :users, :through => :members, dependent: :destroy
  has_many :users, :through => :messages, dependent: :destroy

  validates :name, :description, presence: true

end
