class AddDetailsToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :identity_number, :integer
  end
end
