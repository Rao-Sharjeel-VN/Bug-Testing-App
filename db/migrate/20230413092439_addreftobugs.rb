class Addreftobugs < ActiveRecord::Migration[7.0]
  def change
    add_reference :bugs, :users
  end
end
