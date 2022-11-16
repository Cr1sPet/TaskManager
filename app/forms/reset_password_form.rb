class ResetPasswordForm
  include ActiveModel::Model

  attr_accessor(
    :password,
    :password_confirmation,
  )

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
