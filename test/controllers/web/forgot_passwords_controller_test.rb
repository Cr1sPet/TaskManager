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
    assert_emails 1 do
      post :create, params: { forgot_password_form: attrs }
    end
    assert_response :success

    user.reload

    assert_not_nil user.recovery_password_token
    assert_not_nil user.recovery_password_sent_at

    assert_match "The link has been sent to the email you entered and will be valid for 24 hours", @response.body

    attrs = {
      email: "#{user.email}INCORRECT"
    }

    post :create, params: { forgot_password_form: attrs }

    assert_response :success
    assert_match "Send email", @response.body

  end

end
