class AddUserIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :UserId, :integer
  end
end
