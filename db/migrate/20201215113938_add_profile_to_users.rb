class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users,:Profile, :string
  end
end
