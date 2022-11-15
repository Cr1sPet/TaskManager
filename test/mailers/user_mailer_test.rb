require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "task created" do
    user = create(:user)
    params = { user: user }
    email = UserMailer.with(params).task_created

    assert_emails 1 do
      email.deliver_now
    end
  end
end
