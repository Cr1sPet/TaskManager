require 'test_helper'

class Web::ResetPasswordsControllerTest < ActionController::TestCase

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    
  end

end
