class AddDetailsToBranches < ActiveRecord::Migration[6.1]
  def change
    add_column :branches, :ifsc_code, :integer
    add_column :branches, :address, :text
  end
end
