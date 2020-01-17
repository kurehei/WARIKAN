class AddMemberIdToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :member_id, :bigint,null: false
  end
end
