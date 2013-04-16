class UsersController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@users = User.order(:username).all
  	
  	if user_signed_in?
  		@user = current_user
  	end
  end

  def show
  	begin
  		@user = User.find params[:id]
  	rescue
  		redirect_to users_path :alert => "No user by that id"
  	end
  end

  def edit
  	begin
  		@user = User.find params[:id]
  	rescue
  		redirect_to users_path
  	end
  end

  def update
	begin  
  		@user = User.find_by_id(params[:id])
  		if @user.update_attributes(params[:user])
  			redirect_to @user, notice: "User was saved successfully!"
  		else
  			render :edit
  		end
  	rescue
  		render :edit
  	end
  end

  def new
  	if user_signed_in?
  		redirect_to users_path
  	else
  		@user = User.new  #this creates an instance for submitting to the database.
  	end
  end

  def destroy
  end

  def create
    @user = User.new(params[:user])
    if @user.valid? then
    	if @user.save!
    		redirect_to @user, notice: "User was saved successfully"
    	else
    		render :new
    	end	
    else
    	render :new	
    end
  end
end
