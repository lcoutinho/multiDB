class CreateUsers2 < ActiveRecord::Migration
  db_magic :connections => [:logs]

  def up
  end

  def change
    
    create_table :logs do |t|
       t.string :info
       t.timestamps
     end


  end

  def down
  end
end
