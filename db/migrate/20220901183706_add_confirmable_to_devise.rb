class AddConfirmableToDevise < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, unique: true
    User.reset_column_information
    User.update_all confirmed_at: DateTime.now
  end
end
