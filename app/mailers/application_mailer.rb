class ApplicationMailer < ActionMailer::Base
  default from: "contato@wgfinancas.com.br"

  def recovery_pass_message(user)
  	@user = user
  	mail(:to => user.email, :subject => "Alteração de senha do usuário no site da WGFP.")
  end

end
