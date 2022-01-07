class AddBranchRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :branch, null: true, foreign_key: true
  end
end
