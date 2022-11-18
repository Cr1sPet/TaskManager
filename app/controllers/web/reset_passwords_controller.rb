class Web::ResetPasswordsController < Web::ApplicationController
  include ResetPasswordHelper

  def edit
    @reset_password = ResetPasswordForm.new
    @token = params[:id]
  end

  def update
    @token = params[:id]

    @reset_password = ResetPasswordForm.new(reset_password_params)

    if !@reset_password.valid?
      render(:edit) and return
    end

    if reset_password?(@token, @reset_password.password)
      redirect_to(:root)
    else
      @is_token_outdated = true
      render(:edit)
    end
  end

  private

  def reset_password_params
    params.require(:reset_password_form).permit(:password, :password_confirmation)
  end
end
