require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # test "the false" do
  #   assert false, "The false is not true"
  # end

  # test "fail" do
  #   blargh
  # end

  test "user email never nil" do
    u = User.new
    u.email = nil
    assert_not u.save, "User emails should never be nil"

    one = users(:one)
    one.email = nil
    assert_not one.save, "Edited user email should never be nil"
  end
end
