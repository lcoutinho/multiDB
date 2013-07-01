class UsersController < ApplicationController

  def index
    @users1 = User.on_db(:users).all
    @users2 = User.on_db(:users2).all
  end

end
