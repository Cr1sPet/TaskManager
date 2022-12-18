class Web::ForgotPasswordsController < Web::ApplicationController
  include ResetPasswordHelper

  def new
    @forgot_password = ForgotPasswordForm.new
  end

  def create
    @forgot_password = ForgotPasswordForm.new(forgot_password_params)
    @user = @forgot_password.user

    return render(:new) if @forgot_password.invalid?

    add_recovery_token_to_user(@user)
    SendForgotPasswordNotificationJob.perform_async(@user.id)
  end

  private

  def forgot_password_params
    params.require(:forgot_password_form).permit(:email)
  end
end
