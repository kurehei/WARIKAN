class CreatePaymentResults < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_results do |t|
      t.references :content, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true
      t.string :amount, null: false
      t.timestamps
    end
  end
end
