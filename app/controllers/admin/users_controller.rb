class Admin::UsersController < AdminController
  def index
    @users = User.order('id desc')
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end
