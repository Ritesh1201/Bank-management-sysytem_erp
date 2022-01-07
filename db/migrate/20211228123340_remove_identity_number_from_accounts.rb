class RemoveIdentityNumberFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :identity_number, :integer
  end
end
