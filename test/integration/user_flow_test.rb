require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end
  def setup
    user = User.new(anonymous_username:"anonymous",
      sign_up_code:"GOSSIP_2017", password:"motdepasse",password_confirmation:"motdepasse",
      email:"monEmail@gmail.com").save
  end

  test "home redirect to signup if not loggin" do
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

  test "home redirect to gossips#index if not loggin" do
    sign_in user
    get root_path
    assert_redirected_to gossips_path



  end

end
