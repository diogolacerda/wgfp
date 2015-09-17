class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email params[:email]
  	if user && user.authenticate(params[:password])

  		session[:user_id] = user.id

			gflash :success => "Bem-vindo!"

  		redirect_to root_path
  		
  	else
  		gflash :now, :error => "Usuário não encontrado"
      render "new"
  	end
  end

  def destroy
  end

end
