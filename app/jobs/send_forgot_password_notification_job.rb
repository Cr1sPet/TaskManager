class SendForgotPasswordNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  sidekiq_options lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }
  def perform(user_id)
    user = User.find_by(id: user_id)

    UserMailer.with({ user: user, token: user.recovery_password_token }).forgot_password.deliver_now
  end
end
