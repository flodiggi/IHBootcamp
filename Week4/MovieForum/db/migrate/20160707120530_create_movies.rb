class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :imdbid
      t.string :title
      t.string :poster

      t.timestamps
    end
  end
end
