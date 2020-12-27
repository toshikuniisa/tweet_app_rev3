class RenameBackgroundimageColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :backgroundimage, :back_image
  end
end
