class Web::ForgotPasswordsController < Web::ApplicationController
  def new
    @forgot_password = ForgotPasswordForm.new
  end
  def create

    @forgot_password = ForgotPasswordForm.new(forgot_password_params)

    render(:new)

  end

  private
  def forgot_password_params
    params.require(:forgot_password_form).permit(:email)
  end
end
