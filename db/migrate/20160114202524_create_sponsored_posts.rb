class CreateSponsoredPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsored_posts do |t|
      t.integer :topic_id
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps null: false
    end
    add_index :sponsored_posts, :topic_id
  end
end
