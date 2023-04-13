class Addreftobugs2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :bugs, :projects
  end
end
