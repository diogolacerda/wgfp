class SessionsController < ApplicationController

	skip_before_filter :authenticate_user
  
  def new
  end

  def create
  	user = User.find_by_email params[:email]
  	if user && user.authenticate(params[:password])

  		if user.is_blocked || !user.is_activated

  			if user.is_blocked
          gflash :now, :error => "Usuário bloqueado"
        else
          gflash :error => "Usuário inativado"
        end
        render "new" 

  		else	
	  		session[:user_id] = user.id
				gflash :success => "Bem-vindo!"
	  		redirect_to admin_users_path
	  	end
  			
  	else
  		gflash :now, :error => "Usuário não encontrado"
      render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	gflash :success => "Até logo"
  	redirect_to root_url
  end

end
