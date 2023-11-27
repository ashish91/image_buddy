class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :body

      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.integer :views_count, null: false, default: 0
      t.integer :likes_count, null: false, default: 0

      t.timestamps
    end
  end
end
