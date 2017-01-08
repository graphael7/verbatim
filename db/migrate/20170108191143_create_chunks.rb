class CreateChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :chunks do |t|
      t.string :body
      t.references :section

      t.timestamps
    end
  end
end
