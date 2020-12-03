class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.string :content
      t.string :video
      t.string :user_id
      t.integer:likes_count
      t.timestamps
    end
  end
end
