class AddCatergoryIdToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :catergory_id, :integer
  end
end
