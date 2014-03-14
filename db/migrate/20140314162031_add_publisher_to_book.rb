class AddPublisherToBook < ActiveRecord::Migration
  def change
    add_column :books, :publisher_id, :integer
    add_index :books, :publisher_id
  end
end