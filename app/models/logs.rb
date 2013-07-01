class Logs < ActiveRecord::Base
  Logs.switch_connection_to(:logs)
  attr_accessible :info
end
