class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.user_id :integer
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
