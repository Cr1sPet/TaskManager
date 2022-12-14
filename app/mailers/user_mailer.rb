class UserMailer < ApplicationMailer
  def task_created
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'New Task Created')
  end

  def task_updated
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'Task Updated')
  end

  def task_deleted
    @user = params[:user]
    @task = params[:task]

    mail(to: @user.email, subject: 'Task Deleted')
  end

  def forgot_password
    @user = params[:user]
    @token = params[:token]

    mail(to: @user.email, subject: 'Reset password instructions')
  end
end
