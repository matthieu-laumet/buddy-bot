class AddColumnsToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :posted, :boolean
  end
end
