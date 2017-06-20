class UsersController < ApplicationController

def destroy
	@u =User.find(params[:id])
	@u.destroy

	redirect_to static_pages_show_path

end
 def edit
     @user = User.find(params[:id])
   end


   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to static_pages_show_path
     else
       render 'edit'
     end
   end

  private
  def user_params
  	params.require(:user).permit(:name,:date_of_birth,:address,:phone)
  end
 
  def verify_is_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end






end
