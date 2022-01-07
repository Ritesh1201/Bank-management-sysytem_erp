class RemoveCustomerIdFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :customer_id, :integer
  end
end
