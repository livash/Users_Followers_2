class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :scrambled_password
      t.string :session_token
      
      t.timestamps
    end
  end
end
