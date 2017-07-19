class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      # t.belongs_to :user, index: true
      # t.belongs_to :category, index: true
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
