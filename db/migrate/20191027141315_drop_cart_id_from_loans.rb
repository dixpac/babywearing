class DropCartIdFromLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :cart_id, :integer
  end
end
