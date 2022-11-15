class AddRecoveryPasswordSentAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recovery_password_sent_at, :datetime
  end
end
