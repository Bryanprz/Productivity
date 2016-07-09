class CreateSubtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :subtasks do |t|
      t.belongs_to :to_do, foreign_key: true
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
