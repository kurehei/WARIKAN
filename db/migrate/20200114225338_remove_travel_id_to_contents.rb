class RemoveTravelIdToContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :travel_id, :bigint
  end
end
