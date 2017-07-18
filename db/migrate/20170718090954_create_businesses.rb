class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :logo
      t.text :description
      t.text :university
      t.string :location
      t.string :video

      t.timestamps
    end
  end
end
