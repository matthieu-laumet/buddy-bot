class AddColumnsActiveToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :active, :boolean, null: false, default: true
  end
end
