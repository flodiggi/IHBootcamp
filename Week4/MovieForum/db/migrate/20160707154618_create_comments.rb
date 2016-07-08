class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :movie, index: true
      t.string :username
      t.string :text

      t.timestamps
    end
  end
end
