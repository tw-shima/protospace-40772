class UsersController < ApplicationController
  def show
    @name = current_user.name
    @prototype = current_user.prototypes
  end
  
end
