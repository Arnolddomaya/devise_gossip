class AddAnonymousUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :anonymous_username, :string
  end
end
