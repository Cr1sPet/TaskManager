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
    assert_match "The link has been sent to the email you entered and will be valid for 24 hours", @response.body

    attrs = {
      email: "#{user.email}INCORRECT"
    }

    post :create, params: { forgot_password_form: attrs }

    assert_response :success
    assert_match "Send email", @response.body

  end

end
