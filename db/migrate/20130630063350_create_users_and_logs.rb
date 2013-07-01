class CreateUsersAndLogs < ActiveRecord::Migration

  def up
  end

  def change
    
    on_db :users do
      create_table :user do |t|
         t.string :name
         t.timestamps
       end
    end

    on_db :logs do
      create_table :logs do |t|
         t.string :info
         t.timestamps
       end
    end

  end

  def down
  end
end
