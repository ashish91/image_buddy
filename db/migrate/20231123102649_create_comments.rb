class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.references :parent, null: false, polymorphic: true

      t.timestamps
    end
  end
end
