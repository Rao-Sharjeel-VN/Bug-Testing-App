class CreateBuggs < ActiveRecord::Migration[7.0]
  def change
    create_table :buggs do |t|
      t.string :title
      t.string :description
      t.date :deadline
      t.string :screenshot
      t.integer :bugg_type
      t.integer :status
      t.integer :project_id
      t.integer :qa_id
      t.timestamps
    end
  end
end
