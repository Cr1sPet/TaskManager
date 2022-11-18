module ForgotPasswordHelper
  def add_recovery_token_to_user!(user)
    user.recovery_password_token = SecureRandom.urlsafe_base64
    user.recovery_password_sent_at = DateTime.now
    user.save
  end
end
