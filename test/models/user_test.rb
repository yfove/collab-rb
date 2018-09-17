require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test for unique emails
  def test_email_must_be_unique
    user = User.create(email: "davidthechilldude@gmail.com", password: "12345678", password_confirmation: "12345678")
    user2 = User.new(email: "davidthechilldude@gmail.com", password: "00000000", password_confirmation: "00000000")
    refute user2.valid?
  end

  # test for password confirmation functionality
  def test_password_must_match_confirmation
    user = User.new(email: "davidthechilldude@gmail.com", password: "12345678", password_confirmation: "87654321")
    refute user.valid?
  end

  # test if user has entered password second time
  def test_user_must_include_password_confirmation_on_create
    user = User.new(email: "davidthechilldude@gmail.com", password: "12345678")
    refute user.valid?
  end


  # test if the password is 8 characters long
  def test_password_must_be_at_least_8_characters_long
    user = User.new(email: "davidthechilldude@gmail.com", password: "1234", password_confirmation: "1234")
    refute user.valid?
  end
end
