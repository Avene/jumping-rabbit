class RenameOperationNameToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :operations, :name, :title
  end
end