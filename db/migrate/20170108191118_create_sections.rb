class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.text :body
      t.references :speech
      t.timestamps
    end
  end
end
