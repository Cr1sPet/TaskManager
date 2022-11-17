class Web::ResetPasswordsController < Web::ApplicationController
  def edit
    @reset_password = ResetPasswordForm.new
    @token = params[:id]
  end

  def update
    @token = params[:id]
    @reset_password = ResetPasswordForm.new(reset_password_params)
    @user = User.find_by(recovery_password_token: @token)

    if !@reset_password.valid?
      render(:edit)
      return
    end
    if !@user || ((Time.now - @user.recovery_password_sent_at) / 1.day) >= 1
      @incorrect_token = true
      render(:edit)
    else
      @user.password = reset_password_params[:password]
      @user.recovery_password_token = nil
      @user.save
      redirect_to (:root)
    end
  end

  private
  def reset_password_params
    params.require(:reset_password_form).permit(:password, :password_confirmation)
  end

end
