class Project < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :users, :through => :members
  has_many :users, :through => :messages

  validates :name, :description, presence: true

  has_many :categorizations
  has_many :categories, through: :categorizations

end
