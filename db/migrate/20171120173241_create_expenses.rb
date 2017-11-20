class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.date :expense_date
      t.decimal :amount      
      t.references :category, foreign_key: true
      t.references :transaction_type, foreign_key: true

      t.timestamps
    end
  end
end
