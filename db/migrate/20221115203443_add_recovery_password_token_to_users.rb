class AddRecoveryPasswordTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recovery_password_token, :string
  end
end
