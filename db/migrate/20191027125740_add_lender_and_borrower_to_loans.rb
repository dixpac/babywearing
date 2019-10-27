class AddLenderAndBorrowerToLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :loans, :lender, foreign_key: { to_table: :users }
    add_reference :loans, :borrower, foreign_key: { to_table: :users }
  end
end
