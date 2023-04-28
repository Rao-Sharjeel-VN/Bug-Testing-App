class AddDeletedAtToParanoiac < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :deleted_at, :datetime
    add_index :projects, :deleted_at
    add_column :buggs, :deleted_at, :datetime
    add_index :buggs, :deleted_at
  end
end
