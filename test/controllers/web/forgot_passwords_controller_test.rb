require 'test_helper'

class Web::ForgotPasswordsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    user = create(:user)
    attrs = {
      email: user.email,
    }
    post :create, params: { forgot_password_form: attrs }
    assert_response :success
  end

end
