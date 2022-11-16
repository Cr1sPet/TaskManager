require 'test_helper'

class Web::ResetPasswordsControllerTest < ActionController::TestCase

  test 'should get edit' do
    get :edit, params: { id: "test" }
    assert_response :success
  end

  test 'should post create' do

  end

end
