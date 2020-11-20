class Admin::UsersController < AdminController
  def index
    @users = User.order('id desc')
  end

  def update
  end
end
