module LoginMacros
	def login(user_email, user_pass)
		visit new_session_path
		fill_in 'email', with: user_email
		fill_in 'password', with: user_pass
		click_button "Acessar"
		sleep 1
	end

	def logout
		click_link "Sair"
	end
end