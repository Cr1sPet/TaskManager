class SendTaskCreateNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return if task.blank?

    UserMailer.with(user: task.author, task: task).task_created.deliver_now
  end
end
