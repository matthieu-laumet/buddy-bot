class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :post_at
      t.references :batch, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
