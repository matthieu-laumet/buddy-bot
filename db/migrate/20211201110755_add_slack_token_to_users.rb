class AddSlackTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :slack_token, :string
  end
end
