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

  def create_recovery_pass

  	user = User.find_by_email params[:email]

  	if user

  		user.update_column(:recovery_token, SecureRandom.urlsafe_base64)
  		ApplicationMailer.recovery_pass_message(user).deliver_now
  		gflash :success => "Verifique em seu email sua nova senha"
      redirect_to new_session_path

  	else

  		gflash :now, :error => "Email não encontrado"
      render 'recovery_pass'

  	end

  end	

  def edit_pass

  	if params[:recovery_token]
      # efetua logoff para evitar de alterar senha do user logado
      session[:user_id] = nil
  		@user = User.find_by_recovery_token params[:recovery_token]
  	end
  	if current_user
			@user = current_user
  	end

  	if !@user
  		gflash :error => "Usuário não encontrado"
      redirect_to root_path
  	end

  end

end
