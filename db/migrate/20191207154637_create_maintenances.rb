class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.belongs_to :car, null: false, foreign_key: true
      t.string :title
      t.date :completed_on
      t.integer :completed_mirage

      t.timestamps
    end
  end
end
