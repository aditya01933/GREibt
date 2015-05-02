class AddPostCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :post_count, :integer
  end
end
