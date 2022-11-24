class Web::ResetPasswordsController < Web::ApplicationController
  include ResetPasswordHelper

  def edit
    @reset_password = ResetPasswordForm.new
    @token = params[:id]
  end

  def update
    @token = params[:id]
    @reset_password = ResetPasswordForm.new(reset_password_params)

    return render(:edit) if @reset_password.invalid?

    user = User.find_by(recovery_password_token: @token)
    if token_actual?(user)
      reset_password(user, @reset_password.password)
      redirect_to(:root)
    end
  end

  private

  def reset_password_params
    params.require(:reset_password_form).permit(:password, :password_confirmation)
  end
end
