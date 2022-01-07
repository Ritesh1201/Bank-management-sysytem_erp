class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :contact_no, :integer
    add_column :users, :address, :string
  end
end
