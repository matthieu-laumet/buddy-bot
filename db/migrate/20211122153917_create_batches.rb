class CreateBatches < ActiveRecord::Migration[6.0]
  def change
    create_table :batches do |t|
      t.integer :camp

      t.timestamps
    end
  end
end
