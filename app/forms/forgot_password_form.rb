class ForgotPasswordForm
  include ActiveModel::Model

  attr_accessor(
    :email,
  )

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validate :user_valid?

  def user
    @user = User.find_by(email: email)
    @user
  end

  private

  def user_valid?
    if user.blank?
      errors.add(:email, "user with emails: #{email} doesn't exist")
    end
  end
end
