class User < ActiveRecord::Base
  set_table_name 'user'
  User.switch_connection_to(:users2)

  attr_accessible :name
end
