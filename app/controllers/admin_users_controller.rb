class AdminUsersController < ApplicationController

	before_filter :only_admin
  
  def index
  	@grid = UsersGrid.new(params[:users_grid]) do |scope|
			scope.page params[:page]
		end

    # Consultor e Status somente para Admin
		if @current_user.profile_id == 1

      @grid.column(:consultant, :html => true, :header => "Consultor") do |record|
		  	if record.consultant
		      record.consultant.name
		    end
		  end
		  @grid.column(:is_blocked, :html => true, :header => "Status")
		  @grid.column(:actions, :html => true) do |record|
        render "datagrid_actions", :object => record  
      end
    end
    
    # Coluna de editar apenas para Consultor
    if @current_user.profile_id == 2

      @grid.column(:actions, :html => true) do |record|
        render "datagrid_actions_edit", :object => record  
      end
    end

  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.skip_validate_pass = true
    if @user.update user_params
      gflash :success
      redirect_to admin_users_path
    else
      gflash :now, :error => @user.errors.full_messages.join('<br>')
      render :edit
    end
  end

  def destroy
    User.destroy params[:id]
    gflash :success => "Usuário excluído com sucesso"
    redirect_to admin_users_path
  end

  def create
  	@user = User.new user_params

    if @user.save
        @user.update_column(:is_activated, true)
        @user.update_column(:is_blocked, false)
        gflash :success
        redirect_to admin_users_path
    else
      gflash  :error => @user.errors.full_messages.join('<br>')
      render :new
    end
  end

  def user_params
    params.require(:user).permit(
      :is_blocked,
      :is_activated,
      :profile_id,
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end


end
