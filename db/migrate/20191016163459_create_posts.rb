class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at
      t.references :type, polymorphic: true, index: true

      t.timestamps
    end
  end
end
