class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.text :content
      t.string :question
      t.text :html_content
      t.integer :position
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
