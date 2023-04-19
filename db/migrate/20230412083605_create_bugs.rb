class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.date :deadline
      t.string :screenshot
      t.integer :type
      t.integer :status
      t.integer :project_id
      t.integer :dev_id
      t.integer :qa_id

      t.timestamps
    end
  end
end
