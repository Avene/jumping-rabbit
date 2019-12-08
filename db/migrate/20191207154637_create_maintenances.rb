class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.belongs_to :car, null: false, foreign_key: true
      t.string :title
      t.date :completed_on, null: false
      t.integer :completed_mirage, null: false

      t.timestamps
    end
  end
end
