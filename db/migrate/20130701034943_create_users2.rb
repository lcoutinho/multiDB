class CreateUsers2 < ActiveRecord::Migration
  def up
  end

  def change
    
    on_db :users2 do
      create_table :user do |t|
         t.string :name
         t.timestamps
       end
    end

  end

  def down
  end
end
