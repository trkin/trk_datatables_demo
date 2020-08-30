class UsersController < ApplicationController
  def index
    @datatable = UsersDatatable.new view_context
  end

  def search
    render json: UsersDatatable.new(view_context)
  end

  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update _user_params
      redirect_to users_path
    else
      render :show
    end
  end

  def _user_params
    params.require(:user).permit(:email, :name, :registered_at)
  end
end
