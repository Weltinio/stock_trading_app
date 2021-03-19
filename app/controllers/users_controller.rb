class UsersController < ApplicationController
  
  # before_action :configure_sign_up_params, :configure_sign_up_params

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to users_path, notice: "New user created"
    else
        render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path, notice: "User updated"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: "User deleted"
  end

  private
  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :date_of_birth, :role, :approved)
  end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:create, keys: [:first_name, :last_name, :date_of_birth, :role, :approved])
  # end
  
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:update, keys: [:first_name, :last_name, :date_of_birth, :role, :approved])
  # end

end
