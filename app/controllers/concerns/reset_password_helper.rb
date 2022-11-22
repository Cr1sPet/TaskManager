module ResetPasswordHelper
  def add_recovery_token_to_user(user)
    user.recovery_password_token = SecureRandom.urlsafe_base64
    user.recovery_password_sent_at = DateTime.now
    user.save
  end

  def reset_password(token, new_password)
    update_password(new_password) if token_actual?(token)
  end

  private

  def token_actual?(token)
    @user = User.find_by(recovery_password_token: token)
    @user.present? && ((@user.recovery_password_sent_at + 1.day) > Time.now.utc)
  end

  def update_password(new_password)
    @user.password = new_password
    @user.recovery_password_token = nil
    @user.save
  end
end
