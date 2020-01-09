class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :travel, null: false, foreign_key: true, index: true
      t.string :name, comment: "項目"
      t.text :body, comment: "内容"
      t.integer :amount, null: false,  comment: "金額"
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end
