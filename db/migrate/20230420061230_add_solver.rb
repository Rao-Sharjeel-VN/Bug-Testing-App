class AddSolver < ActiveRecord::Migration[7.0]
  def change
    add_column :buggs, :solver_id, :int
  end
end
