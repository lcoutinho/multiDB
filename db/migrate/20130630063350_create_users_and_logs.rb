class CreateUsersAndLogs < ActiveRecord::Migration
  db_magic :connections => [:users, :users2, :users3, :users4, :users5]
  def up
  end

  def change
    
    create_table :user do |t|
       t.string :name
       t.timestamps
     end

  end

  def down
  end
end
