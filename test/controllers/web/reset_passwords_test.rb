require 'test_helper'

class Web::ResetPasswordsControllerTest < ActionController::TestCase
  test 'should get edit' do
    get :edit, params: { id: 'test' }
    assert_response :success
  end

  test 'should put update' do
    user = create(:user)

    token = 'token'
    user.update_column(:recovery_password_token, token)
    user.update_column(:recovery_password_sent_at, DateTime.now)

    attrs = {
      password: 'test_reset_password',
      password_confirmation: 'test_reset_password',
    }
    patch :update, params: { id: token, reset_password_form: attrs }
    assert_response :redirect

    user.reload
    assert_nil user.recovery_password_token
  end
end
