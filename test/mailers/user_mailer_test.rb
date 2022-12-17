require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'task created' do
    user = create(:user)
    task = create(:task, author: user)
    params = { user: user, task: task }
    email = UserMailer.with(params).task_created

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@taskmanager.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'New Task Created', email.subject
    assert email.body.to_s.include?("Task #{task.id} was created")
  end

  test 'task updated' do
    user = create(:user)
    task = create(:task, author: user)
    params = { user: user, task: task }
    email = UserMailer.with(params).task_updated

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@taskmanager.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Task Updated', email.subject
    assert email.body.to_s.include?("Task #{task.id} was updated")
  end

  test 'task deleted' do
    user = create(:user)
    task = create(:task, author: user)
    params = { user: user, task_id: task.id }
    email = UserMailer.with(params).task_deleted

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@taskmanager.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Task Deleted', email.subject
    assert email.body.to_s.include?("Task #{task.id} was deleted")
  end

  test 'forgot password' do
    user = create(:user)
    user.update_column(:recovery_password_token, SecureRandom.urlsafe_base64)
    params = { user: user, token: user.recovery_password_token }
    email = UserMailer.with(params).forgot_password

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['noreply@taskmanager.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Reset password instructions', email.subject
    assert email.body.to_s.include?('We received your request to change your password. To do this, just click on the link:')
    assert email.body.to_s.include?(user.recovery_password_token)
  end
end
