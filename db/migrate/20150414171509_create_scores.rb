class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :marks
      t.references	:user
      t.timestamps
    end
  end
end
