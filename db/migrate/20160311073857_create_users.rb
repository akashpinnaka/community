class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.text :details
      t.string :name
      t.string :party
      
      t.timestamps null: false
    end
  end
end
