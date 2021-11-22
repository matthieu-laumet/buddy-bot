class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :title
      t.text :next_accroche
      t.integer :position
      t.references :interaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
