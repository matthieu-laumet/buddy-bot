class AddColumnsContentToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :content, :string
  end
end
