class CreateSpeeches < ActiveRecord::Migration[5.0]
  def change
    create_table :speeches do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
  end
end
