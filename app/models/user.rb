class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :members

  has_many :projects, :through => :messages, dependent: :destroy
  has_many :projects, :through => :members, dependent: :destroy

  validates :password, length: {minimum: 8}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end
end
