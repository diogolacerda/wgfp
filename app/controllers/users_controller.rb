class UsersController < ApplicationController
 
	skip_before_filter :authenticate_user, :except => [:index, :new_admin, :edit]

  def activate_account
    @user = User.find_by_activation_token params[:activation_token]
    if @user
      @user.update_column(:is_activated, true)
      session[:user_id] = @user.id
      gflash :success => "Acesso validado com sucesso"
      redirect_to new_user_path
    end
  end

  def index
  end

  def new
  end

  def edit
  end

end
