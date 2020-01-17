class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :travel, null: false, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
