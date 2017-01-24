class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :learnt
      t.string :problem
      t.string :possible_fix
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :feedbacks, [:user_id, :created_at]
  end
end
