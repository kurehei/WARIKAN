class CreateAdvanceMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :advance_members do |t|
      t.references :content, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.timestamps
    end
  end
end
