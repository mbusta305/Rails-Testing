require 'test_helper'

class UserCreateTest < ActionDispatch::IntegrationTest
  test "index and create user" do
    # get users index
    get '/users'
    assert_response :success
    # get new user form
    get '/users/new'
    assert_response :success
    # test create a new user
    assert_difference('User.count') do
    post_via_redirect '/users', user: { email:
    'integration@wyncode.co', name: 'Integration Test'}
    end
    # test redirect to /users/something
    assert_match /\/users\/\d+/, path
    assert_equal 'User was successfully created.', flash[:notice]
    # test new user appears on index page
    get '/users'
    assert_select 'td', 'integration@wyncode.co', 1
    assert_select 'td', 'Integration Test', 1
  end
end
