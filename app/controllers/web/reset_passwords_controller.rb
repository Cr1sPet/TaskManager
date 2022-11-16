class Web::ResetPasswordsController < Web::ApplicationController
  def edit
    @reset_password = ResetPasswordForm.new
    @token = params[:id]
  end

  def update
  end

end
