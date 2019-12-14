class AddDescriptionToMaintenance < ActiveRecord::Migration[5.0]
  def change
    add_column :maintenances, :description, :string
  end
end