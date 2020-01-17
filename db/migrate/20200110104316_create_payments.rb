class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :member, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.integer :payed_amount
      t.timestamps
    end
  end
end
