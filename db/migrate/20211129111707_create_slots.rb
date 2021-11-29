class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.integer :batch_camp
      t.integer :topic_title
      t.datetime :day_of_week
      t.datetime :hour
      t.timestamps
    end
  end
end
