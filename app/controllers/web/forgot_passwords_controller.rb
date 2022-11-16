class Web::ForgotPasswordsController < Web::ApplicationController
  def new
    @forgot_password = ForgotPasswordForm.new
  end
  def create

    @forgot_password = ForgotPasswordForm.new(forgot_password_params)
    if !@forgot_password.user.blank?
      @user = @forgot_password.user
      @user.update_column(:recovery_password_token, SecureRandom.urlsafe_base64)
      @user.update_column(:recovery_password_sent_at, DateTime.now)
      UserMailer.with({ user: @user, token: @user.recovery_password_token }).forgot_password.deliver_now

    end
    render(:new)

  end

  private
  def forgot_password_params
    params.require(:forgot_password_form).permit(:email)
  end
end
