class ForgotPasswordForm
  include ActiveModel::Model

  attr_accessor(
    :email,
  )

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validate :user_valid?

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def user_valid?
    if user.blank?
      errors.add(:email, :not_found, model: :user, field: :email, value: email)
    end
  end
end
