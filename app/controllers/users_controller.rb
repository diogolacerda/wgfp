class UsersController < ApplicationController
 
	skip_before_filter :authenticate_user, :except => [:index, :edit, :update]

  def activate_account
    @user = User.find_by_activation_token params[:activation_token]
    if @user
      @user.update_column(:is_activated, true)
      session[:user_id] = @user.id
      gflash :success => "Acesso validado com sucesso"
      redirect_to new_user_path
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
    @user.step = user_params[:step]
    @user.skip_validate_pass = true
    step = user_params[:step]
    
    if @user.update(user_params)
      
      gflash :success
     
      redirect_to user_step_path(@user, step.to_i + 1)

    else
      
      gflash :now, :error => @user.errors.full_messages.join('<br>')
      render :edit

    end
  end

  def create
  	@user = User.new user_params
    
    # Define o user como cliente
    @user.profile_id = 3

    @user.activation_token = SecureRandom.urlsafe_base64
    if @user.save
      # Envia email para usuário ativar seu cadastro
      ApplicationMailer.new_user_message(@user).deliver_now
      gflash :success => "Seu cadastro foi realizado, mas para sua segurança, solicitamos que acesse a conta de e-mail cadastrada e acesse o link para validação de seus dados. Obrigado!"
      redirect_to new_session_path
    else
      gflash :now, :error => @user.errors.full_messages.join('<br>')
      render 'new'
    end
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

  def update_pass
  	@user = User.find params[:id]
  	if @user.update_attributes(user_params)
  		# Autentica o user
  		session[:user_id] = @user.id

  		gflash :success
  		redirect_to root_path
  	else
  		gflash :error => @user.errors.full_messages.join('<br>')
      redirect_to edit_pass_path @user
  	end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :consultant_id,
      :email_secondary,
      :phone,
      :celphone,
      :birthday,
      :civil_state_id,
      :nationality_id,
      :profession,
      :zip_code,
      :complement,
      :cpf,
      :rg,
      :issuer,
      :step
    )
  end

end
