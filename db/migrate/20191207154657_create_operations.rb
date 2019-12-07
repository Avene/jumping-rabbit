class CreateOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :operations do |t|
      t.belongs_to :maintenance, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
