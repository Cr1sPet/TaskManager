class UserMailer < ApplicationMailer
  def task_created
    user = params[:user]

    mail(to: user.email)
  end
end
