class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :link
      t.datetime :start_date
      t.datetime :due_date

      t.timestamps
    end
  end
end
