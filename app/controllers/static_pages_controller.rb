class StaticPagesController < ApplicationController
	 def home
    end
    def show
  #@users = User.all 
  @users = User.paginate(:page => params[:page], :per_page => 5)
  #users is an array to hold values by User model
end


end

