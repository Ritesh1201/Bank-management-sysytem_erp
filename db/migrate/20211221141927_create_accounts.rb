class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.integer :acc_no
      t.string  :acc_type
      t.integer :branch_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
