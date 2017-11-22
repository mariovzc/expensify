class ChangeNameOfDate < ActiveRecord::Migration[5.1]
  def change
    rename_column :expenses, :expense_date, :date
  end
end
