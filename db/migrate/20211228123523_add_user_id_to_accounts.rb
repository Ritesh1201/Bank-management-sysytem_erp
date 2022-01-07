class AddUserIdToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :user_id, :integer
  end
end
