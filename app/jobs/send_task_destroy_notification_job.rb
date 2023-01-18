class SendTaskDestroyNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  sidekiq_options lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }
  def perform(task_serialized)
    task = deserialize_task(task_serialized)
    UserMailer.with({ user: task.author, task: task }).task_deleted.deliver_now
  end

  private

  def deserialize_task(task)
    JSON.parse(task, object_class: Task)
  end
end
