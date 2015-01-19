class AddSlugToUserdetails < ActiveRecord::Migration
  def change
    add_column :userdetails, :slug, :string
  end
end
