class SendTaskDestroyNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  def perform(user_id, task_id)

    user = User.find_by(id: user_id)

    UserMailer.with({ user: user, task_id: task_id }).task_deleted.deliver_now

  end
end