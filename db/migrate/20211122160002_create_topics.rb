class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :first_accroche
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
