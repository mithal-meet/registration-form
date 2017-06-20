class StaticPagesController < ApplicationController
	 
before_filter :verify_is_admin, :only => [:show]
	 def home
	 	
    end

    def show
    	#@users = User.paginate(:page => params[:page], per_page: 10)
    	@users = User.all
    end

   def edit
  @u = User.find(params[:id])
  end
def update
  @article = User.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

  def destroy
  @u = User.find(params[:user_id])
  #puts (@u.id)
  @u.destroy
 
  redirect_to root_path
end
def block
    @u = User.find(params[:id])
    #puts (@u.id)
    @u.banned = true
    @u.save

 end

 def unblock
    @u = User.find(params[:id])
    #puts (@u.id)
    @u.banned = false
    @u.save

 end

     private

  # This should probably be abstracted to ApplicationController
  def verify_is_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end

