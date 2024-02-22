class FixTypeName < ActiveRecord::Migration[7.1]
  def change
    rename_column :transactions, :type, :ttype
  end
end
