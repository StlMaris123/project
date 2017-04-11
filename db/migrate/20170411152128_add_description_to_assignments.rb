class AddDescriptionToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :description, :text
  end
end
