class ChangesItemColumnNameToUnitPrice < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :price, :unit_price
  end
end
