class ApplicationMailer < ActionMailer::Base
  default from: "contato@wgfinancas.com.br"

  def recovery_pass_message(user)
  	@user = user
  	mail(:to => user.email, :subject => "Alteração de senha do usuário no site da WG Finanças.")
  end

  def new_user_message(user)
  	@user = user
  	mail(:to => user.email, :subject => "Conclusão do cadastro no site da WG Finanças")
  end

end
