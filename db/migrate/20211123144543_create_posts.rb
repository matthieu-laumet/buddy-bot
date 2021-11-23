class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.boolean :buddy
      t.text :content
      t.boolean :form
      t.references :user, null: false, foreign_key: true
      t.references :interaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
