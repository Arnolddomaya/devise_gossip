require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:tom)
  end

  test "index redirect to signup if not loggin" do
    get root_path
    assert_redirected_to new_user_session_path
    # assert_template '/sign_up'
    # assert_redirected_to

    # assert_template 'sessions/new'
    # post login_path, params: { session: { email: "", password: "" } }
    # assert_template 'sessions/new'
    # assert_not flash.empty?
    # get root_path
    # assert flash.empty?
  end

  test "redirect to gossip#index after sign up" do
    get new_user_registration_path
    post user_registration_path, params: {email:    "New_email@dmail.com",
                                          anonymous_username: "testAnonym",
                                          password: 'motdepasse',
                                          password_confirmation:'motdepasse',
                                          sign_up_code:"GOSSIP_2017"}
    assert_response :success
  end

  test "index access if  loggin" do
    sign_in @user
    get root_path
    assert_response :success

  #  assert request.fullpath == "/gossips"

  end

end
