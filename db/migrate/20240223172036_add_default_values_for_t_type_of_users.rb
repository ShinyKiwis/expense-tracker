class AddDefaultValuesForTTypeOfUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :ttype, :string, :default => "expense"
  end
end
