class Web::ForgotPasswordsController < Web::ApplicationController
  include ForgotPasswordHelper

  def new
    @forgot_password = ForgotPasswordForm.new
  end

  def create
    @forgot_password = ForgotPasswordForm.new(forgot_password_params)
    @user = @forgot_password.user

    if @user.present? && add_recovery_token_to_user!(@user)
      UserMailer.with({ user: @user, token: @user.recovery_password_token }).forgot_password.deliver_now
    end
    render(:new)
  end

  private

  def forgot_password_params
    params.require(:forgot_password_form).permit(:email)
  end
end
