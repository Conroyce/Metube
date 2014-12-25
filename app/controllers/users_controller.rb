class UsersController < ApplicationController
  def index
    redirect_to "/users/new"
  end

  def new

  end  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
    # params["user"]["password_hash"] = Digest::SHA2.hexdigest(params["user"]["password_hash"])
    # @user = User.create(user_params)
  end    
    
  def show
    @user = AR::User.find_by(name: params[:name]) #this section of code may be needed in every function for authorization
    if @user.password_hash == Digest::SHA2.hexidigest(params[:password_hash]) 
      #execute code
    end  
  end    

  private
  def user_params
    params.require(:user).permit(:name,:password, :password_confirmation)
  end  
end
