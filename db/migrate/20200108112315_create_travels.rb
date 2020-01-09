class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name,null: false
      t.date :from_date
      t.date :to_date
      t.text :detail
      t.timestamps
    end
  end
end
