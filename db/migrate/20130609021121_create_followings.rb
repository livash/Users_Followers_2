class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_user_id
      
      t.timestamps
    end
  end
end
