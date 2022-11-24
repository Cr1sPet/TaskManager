module ResetPasswordHelper
  def add_recovery_token_to_user(user)
    user.recovery_password_token = SecureRandom.urlsafe_base64
    user.recovery_password_sent_at = DateTime.now
    user.save
  end

  def reset_password(user, new_password)
    user.password = new_password
    user.recovery_password_token = nil
    user.save
  end

  def token_actual?(user)
    user.present? && ((user.recovery_password_sent_at + 1.day) > Time.now.utc)
  end
end
