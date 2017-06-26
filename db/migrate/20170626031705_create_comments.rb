class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :input
      t.timestamps
      t.references :project
    end 
  end
end
