class AddAverageAmountToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :average_amount, :string, null: false
  end
end
