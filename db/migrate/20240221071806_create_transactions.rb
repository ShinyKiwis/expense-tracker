class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.string :category
      t.string :type
      t.decimal :amount

      t.timestamps
    end
  end
end
