class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
    	t.integer :score
    	t.references :user
    	t.timestamps
    end
  end
end
